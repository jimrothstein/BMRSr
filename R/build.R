# Functions to build API calls


#' Create an API call for B-data flows
#'
#' @param data_item character string; the id of the B flow
#' @param api_key character string; api key retreived from the Elexon portal
#' @param settlement_date character string; settlement date (automatically cleaned by format_date)
#' @param settlement_period character string; settlement period
#' @param year character string; year
#' @param month character string; month
#' @param week character string; week
#' @param process_type character string; process type
#' @param start_time character string; start time
#' @param end_time character string; end time
#' @param start_date character string; start date
#' @param end_date character string; end date
#' @param service_type character string; file format (csv or xml)
#' @param api_version character string; version of the api to use (currently on v1)
#' @return character string; created url for the call
#' @family call-building functions
#' @export
#' @examples
#' build_b_call(data_item = "B1730", api_key = "12345", settlement_date = "14-12-2016")

build_b_call <- function(data_item, api_key, settlement_date = NULL, period = NULL,
                         year = NULL, month = NULL, week = NULL, process_type = NULL, start_time = NULL,
                         end_time = NULL, start_date = NULL, end_date = NULL, service_type = "csv", api_version = "v1") {
  url = paste0("https://api.bmreports.com/BMRS/", data_item, "/", api_version, "?APIKey=", api_key)
  check_data_item(data_item, "B Flow")
  if (!is.null(settlement_date)) {
    url = paste0(url, "&SettlementDate=", format_date(settlement_date))
  }
  if (!is.null(period)){
    url = paste0(url, "&Period=", period)
  }
  if (!is.null(process_type)){
    url = paste0(url, "&ProcessType", process_type)
  }
  if (!is.null(year)){
    url = paste0(url, "&Year=", year)
  }
  if (!is.null(month)){
    url = paste0(url, "&Month=", month)
  }
  if (!is.null(week)){
    url = paste0(url, "&Week=", week)
  }
  if (!is.null(start_date)){
    url = paste0(url, "&StartDate=", start_date)
  }
  if (!is.null(end_date)){
    url = paste0(url, "&EndDate=", end_date)
  }
  if (!is.null(start_time)){
    url = paste0(url, "&StartTime=", start_time)
  }
  if (!is.null(end_time)){
    url = paste0(url, "&EndTime=", end_time)
  }
  url = paste0(url, "&ServiceType=", service_type)
  return(url)
}

#' Create an API call for REMIT flows
#'
#' @param data_item character string; the id of the REMIT flow
#' @param api_key character string; api key retreived from the Elexon portal
#' @param event_start character string; event start (automatically cleaned by format_date)
#' @param event_end character string; event end (automatically cleaned by format_date)
#' @param publication_from character string; publication from (automatically cleaned by format_date)
#' @param publication_to character string; publication to (automatically cleaned by format_date)
#' @param participant_id character string; participant id
#' @param asset_id character string; asset id
#' @param event_type character string; event type
#' @param fuel_type character string; fuel type
#' @param message_type character string; message type
#' @param message_id character string; message id
#' @param unavailability_type character string; unavailability type
#' @param active_flag character string; active flag
#' @param sequence_id character string; sequence id
#' @param service_type character string; file format (csv or xml)
#' @param api_version character string; version of the api to use (currently on v1)
#' @return string; created url for the call
#' @family call-building functions
#' @examples
#' build_remit_call(data_item = "MessageListRetrieval", api_key = "12345", settlement_date = "14-12-2016")
#' @export

build_remit_call <- function(data_item, api_key, event_start = NULL, event_end = NULL, publication_from = NULL, publication_to = NULL,
                             participant_id = NULL, asset_id =  NULL, event_type = NULL, fuel_type = NULL, message_type = NULL, message_id = NULL,
                             unavailability_type =  NULL, active_flag = NULL, sequence_id = NULL, service_type = "xml", api_version = "v1"){
  check_data_item(data_item, "REMIT")
  url = paste0("https://api.bmreports.com/BMRS/", data_item, "/", api_version, "?APIKey=", api_key)
  if (service_type == "csv"){
    warning("Remit files cannot be returned as .csv - file will be returned as xml")
    service_type = "xml"
  }
  if (!is.null(event_start)) {
    url = paste0(url, "&EventStart=", format_date(event_start))
  }
  if (!is.null(event_end)) {
    url = paste0(url, "&EventEnd=", format_date(event_end))
  }
  if (!is.null(publication_from)) {
    url = paste0(url, "&PublicationFrom=", format_date(publication_from))
  }
  if (!is.null(publication_to)) {
    url = paste0(url, "&PublicationTo=", format_date(publication_to))
  }
  if (!is.null(participant_id)) {
    url = paste0(url, "&ParticipantID=", participant_id)
  }
  if (!is.null(asset_id)) {
    url = paste0(url, "&AssetID=", asset_id)
  }
  if (!is.null(event_type)) {
    url = paste0(url, "&EventType=", event_type)
  }
  if (!is.null(fuel_type)) {
    url = paste0(url, "&FuelType=", fuel_type)
  }
  if (!is.null(message_type)) {
    url = paste0(url, "&MessageType=", message_type)
  }
  if (!is.null(message_id)) {
    url = paste0(url, "&MessageID=", message_id)
  }
  if (!is.null(unavailability_type)) {
    url = paste0(url, "&UnavailabilityType=", unavailability_type)
  }
  if (!is.null(active_flag)) {
    url = paste0(url, "&ActiveFlag=", active_flag)
  }
  if (!is.null(sequence_id)) {
    url = paste0(url, "&SequenceId=", sequence_id)
  }
  if (!is.null(service_type)){
    url = paste0(url, "&ServiceType=", service_type)
  }
  return(url)
}

#' Create an API call for legacy data
#'
#' @param data_item character string; the id of the legacy data
#' @param api_key character string; api key retreived from the Elexon portal
#' @param from_date character string; from date (automatically cleaned by format_date)
#' @param to_date character string; to date (automatically cleaned by format_date)
#' @param settlement_date character string; settlement date (automatically cleaned by format_date)
#' @param settlement_period character string; settlement period
#' @param bm_unit_id character string; BM Unit ID
#' @param lead_party_name character string;  lead party name
#' @param ngc_bm_unit_name character string; NGC BM Unit name
#' @param from_cleared_date character string; from cleared date (automatically cleaned by format_date)
#' @param to_cleared_date character string; to cleared dat (automatically cleaned by format_date)
#' @param is_two_day_window character string; is two day window
#' @param from_datetime character string; from datetime
#' @param to_datetime character string; to datetime
#' @param from_settlement_date character string; from settlement date (automatically cleaned by format_date)
#' @param to_settlement_date character string; to settlement date (automatically cleaned by format_date)
#' @param period character string; period
#' @param fuel_type character string; fuel type
#' @param balancing_service_volume character string; balancing service volume
#' @param zone_identifier character string; zone identifier
#' @param start_time character string; start time
#' @param trade_type character string; trade type
#' @param service_type character string; file format (csv or xml)
#' @param api_version character string; version of the api to use (currently on v1)
#' @return string; created url for the call
#' @family call-building functions
#' @examples
#' build_legacy_call(data_item = "FUELINST", api_key = "12345", from_datetime = "14-12-201613:00:00", to_datetime = "14-12-201614:00:00")
#' @export

build_legacy_call <- function(data_item, api_key, from_date = NULL, to_date = NULL, settlement_date = NULL, settlement_period =  NULL, bm_unit_id = NULL, bm_unit_type = NULL,
                              lead_party_name = NULL, ngc_bm_unit_name = NULL, from_cleared_date = NULL, to_cleared_date = NULL,
                              is_two_day_window = NULL, from_datetime = NULL, to_datetime = NULL, from_settlement_date = NULL, to_settlement_date = NULL,
                              period = NULL, fuel_type = NULL, balancing_service_volume = NULL, zone_identifier = NULL, start_time = NULL, end_time = NULL,
                              trade_type = NULL, api_version = "v1", service_type = "csv"){
  check_data_item(data_item, "Legacy")
  url = paste0("https://api.bmreports.com/BMRS/", data_item, "/", api_version, "?APIKey=", api_key)
  if (!is.null(from_date)) {
    url = paste0(url, "&FromDate=", format_date(from_date))
  }
  if (!is.null(to_date)) {
    url = paste0(url, "&ToDate=", format_date(to_date))
  }
  if (!is.null(settlement_date)) {
    url = paste0(url, "&SettlementDate=", format_date(settlement_date))
  }
  if (!is.null(settlement_period)){
    url = paste0(url, "&SettlementPeriod=", settlement_period)
  }
  if (!is.null(bm_unit_id)){
    url = paste0(url, "&BMUnitID=", bm_unit_id)
  }
  if (!is.null(bm_unit_type)){
    url = paste0(url, "&BMUnitType=", bm_unit_type)
  }
  if (!is.null(lead_party_name)){
    url = paste0(url, "&LeadPartName=", lead_party_name)
  }
  if (!is.null(ngc_bm_unit_name)){
    url = paste0(url, "&NGCBMUnitName=", ngc_bm_unit_name)
  }
  if (!is.null(from_cleared_date)){
    url = paste0(url, "&FromClearedDate=", format_date(from_cleared_date))
  }
  if (!is.null(to_cleared_date)){
    url = paste0(url, "&ToClearedDate=", format_date(to_cleared_date))
  }
  if (!is.null(is_two_day_window)){
    url = paste0(url, "&IsTwoDayWindow=", is_two_day_window)
  }
  if (!is.null(from_datetime)){
    url = paste0(url, "&FromDateTime=", from_datetime)
  }
  if (!is.null(to_datetime)){
    url = paste0(url, "&ToDateTime=", to_datetime)
  }
  if (!is.null(from_settlement_date)){
    url = paste0(url, "&FromSettlementDate=", format_date(from_settlement_date))
  }
  if (!is.null(to_settlement_date)){
    url = paste0(url, "&ToSettlementDate=", format_date(to_settlement_date))
  }
  if (!is.null(period)){
    url = paste0(url, "&Period=", period)
  }
  if (!is.null(fuel_type)){
    url = paste0(url, "&FuelType=", fuel_type)
  }
  if (!is.null(balancing_service_volume)){
    url = paste0(url, "&BalancingServiceVolume=", balancing_service_volume)
  }
  if (!is.null(zone_identifier)){
    url = paste0(url, "&ZoneIdentifier=", zone_identifier)
  }
  if (!is.null(start_time)){
    url = paste0(url, "&StartTime=", start_time)
  }
  if (!is.null(end_time)){
    url = paste0(url, "&EndTime=", end_time)
  }
  if (!is.null(trade_type)){
    url = paste0(url, "&TradeType=", trade_type)
  }
  if (!is.null(service_type)){
    url = paste0(url, "&ServiceType=", service_type)
  }
}

#' Build an API call (uses the appropriate function based on the data item)
#' @param ... values to be passed to appropriate build_x_call function
#' @family call-building functions
#' @seealso \code{\link{build_b_call}}
#' @seealso \code{\link{build_remit_call}}
#' @seealso \code{\link{build_legacy_call}}
#' @examples
#' build_call(data_item = "TEMP", api_key = "12345", from_date = "12 Jun 2018", to_date = "13 Jun 2018", service_type = "csv")
#' @export
build_call <- function(...){
  params <- list(...)
  if (is.null(params[['data_item']])){
    stop("argument 'data_item' is missing, with no default")
  }
  typed_call <- get_function(params[['data_item']])
  url <- do.call(what = typed_call, args = params)
  return(url)
}