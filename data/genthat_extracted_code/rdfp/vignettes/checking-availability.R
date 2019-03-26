## ---- echo = FALSE-------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  purl = NOT_CRAN,
  eval = NOT_CRAN
)

## ----load-package, eval=FALSE--------------------------------------------
#  suppressWarnings(suppressMessages(library(dplyr)))
#  suppressWarnings(suppressMessages(library(lubridate)))
#  library(rdfp)
#  options(rdfp.network_code = 123456789)
#  dfp_auth()

## ----auth, include = FALSE-----------------------------------------------
suppressWarnings(suppressMessages(library(dplyr)))
suppressWarnings(suppressMessages(library(lubridate)))
library(here)
library(rdfp)
token_path <- here::here("tests", "testthat", "rdfp_token.rds")
suppressMessages(dfp_auth(token = token_path, verbose = FALSE))
options_path <- here::here("tests", "testthat", "rdfp_options.rds")
rdfp_options <- readRDS(options_path)
options(rdfp.network_code = rdfp_options$network_code)

## ----line-item-from-scratch----------------------------------------------
sample_line <- list()
sample_line$startDateTime <- ''
sample_line$endDateTime <- ''
sample_line$deliveryRateType <- 'EVENLY'
sample_line$lineItemType <- 'STANDARD'
sample_line$priority <- 8
sample_line$costType <- 'CPM'
sample_line$creativePlaceholders$size <- list(width=666, height=176, isAspectRatio='false')
sample_line$creativePlaceholders$expectedCreativeCount <- 1
sample_line$creativePlaceholders$creativeSizeType <- 'PIXEL'
sample_line$primaryGoal <- list(goalType='LIFETIME', unitType='IMPRESSIONS', units=1000)
sample_line$targeting <- list(inventoryTargeting=list(targetedAdUnits=list(adUnitId=133765936, 
                                                                           includeDescendants="true")))

## ----modifying-existing-line-item----------------------------------------
my_filter <- "WHERE LineItemType='STANDARD' and Status='DELIVERING' LIMIT 10"
line_item_details <- dfp_getLineItemsByStatement(list(filterStatement=list(query=my_filter)))

# pull out the 1st line item in the list of returned results
# we'll use this as a template for creating the hypothetical line items
single_item <- line_item_details[[1]]

## ----date-converter-func, warning=FALSE----------------------------------
# supply a datetime
dfp_date_to_list(Sys.time())
# supply a date and assume the beginning of the day for hours, mins, secs
dfp_date_to_list(Sys.Date()+1, "beginning")

## ----generating-forecasts------------------------------------------------
all_forecasts <- NULL
month_start_dates <- as.Date(format(Sys.Date() %m+% months(1:6), '%Y-%m-01'))
month_end_dates <- ceiling_date(month_start_dates, 'months') - 1
for(i in 1:length(month_start_dates)){
  this_sample_line <- sample_line
  this_sample_line$startDateTime <- dfp_date_to_list(month_start_dates[i], daytime='beginning')
  this_sample_line$endDateTime <- dfp_date_to_list(month_end_dates[i], daytime='end')
  forecast_request <- list(lineItem=list(lineItem=this_sample_line),
                           forecastOptions=list(includeTargetingCriteriaBreakdown='false', 
                                                includeContendingLineItems='false'))
  this_result <- dfp_getAvailabilityForecast(forecast_request)
  this_result <- this_result[,c('unitType', 'availableUnits', 'reservedUnits')]
  this_result$forecast_month <- format(month_start_dates[i], '%Y-%m')
  all_forecasts <- rbind(all_forecasts, this_result)
}
all_forecasts

## ----getting-geo-codes---------------------------------------------------
# get codes for US states and counties
request_data <- list(selectStatement=
                       list(query="SELECT 
                                      Id
                                    , Name
                                    , CanonicalParentId
                                    , CountryCode
                                    , Type 
                                  FROM Geo_Target 
                                  WHERE CountryCode='US' AND (TYPE='STATE' OR TYPE='COUNTY')"))

us_geos <- dfp_select(request_data)
texas_id <- us_geos %>%
  filter(type == 'STATE', name == 'Texas') %>%
  select(id, state=name)

us_counties <- us_geos %>%
  filter(type == 'COUNTY') %>%
  select(id, canonicalparentid, county=name)

texas_counties <- inner_join(us_counties, texas_id, by=c('canonicalparentid'='id'))

## ----format-geos---------------------------------------------------------
# format the county ids into a list so they can be passed 
# over to the geoTargeting field of the ProspectiveLineItem
geo_targets <- as.list(texas_counties$id)
geo_targets <- lapply(geo_targets, FUN=function(x){list(id=x)})
names(geo_targets) <- rep('targetedLocations', length(geo_targets))

## ----prep-sample-line----------------------------------------------------
this_sample_line <- sample_line

# look at availability for the next 90 days
this_sample_line$startDateTime <- dfp_date_to_list(Sys.Date() + 1, daytime='beginning')
this_sample_line$endDateTime <- dfp_date_to_list(Sys.Date() + 91, daytime='end')

## ----setup-targeting-----------------------------------------------------
# recreate the targeting field from scratch
this_sample_line$targeting <- NULL
this_sample_line$targeting$geoTargeting <- geo_targets
# re-use the inventoryTargeting criteria from the original sample
this_sample_line$targeting$inventoryTargeting <- sample_line$targeting$inventoryTargeting

## ----make-county-request-------------------------------------------------
# request the targeting criteria breakdown this time to get that detail
forecast_request <- list(lineItem=list(lineItem=this_sample_line),
                         forecastOptions=list(includeTargetingCriteriaBreakdown='true', 
                                              includeContendingLineItems='false'))

# get the forecasted availability and make sure to specify as_df=FALSE
this_result <- dfp_getAvailabilityForecast(forecast_request, as_df=FALSE)[[1]]
breakdowns <- this_result[c(names(this_result) %in% 'targetingCriteriaBreakdowns')]

## ----availability-by-county----------------------------------------------
# only select the breakdowns that are GEOGRAPHY
# this omits the Ad Unit and Ad Size breakdowns
geo_breakdowns <- breakdowns[sapply(breakdowns, 
                                    FUN=function(x){
                                      x$targetingDimension == 'GEOGRAPHY'
                                    })]

avails <- plyr::ldply(geo_breakdowns, 
                      .fun=function(x){
                        return(as.data.frame(x))
                      }, .id=NULL)

avails <- avails %>% 
  mutate(ImpressionsTotal=as.integer(matchedUnits),
         ImpressionsAvailable=as.integer(availableUnits), 
         ImpressionsBooked=as.integer(ImpressionsTotal-ImpressionsAvailable), 
         PctAvail=ImpressionsAvailable/ImpressionsTotal) %>%
  select(targetingCriteriaName, ImpressionsTotal, ImpressionsBooked, ImpressionsAvailable, PctAvail)

## ----total-texas-county-availability-------------------------------------
# total availability across Texas counties
sum(avails$ImpressionsAvailable) / sum(avails$ImpressionsTotal)

## ----availability-by-id--------------------------------------------------
# request for this id with no special forecastOptions
forecast_request <- list(lineItemId=single_item$id,
                         forecastOptions = list())

this_result <- dfp_getAvailabilityForecastById(forecast_request)
this_result[,c('lineItemId', 'orderId', 'availableUnits', 'deliveredUnits', 'matchedUnits')]

## ----create-users-test, eval=FALSE---------------------------------------
#  request_data <- list(users=list(name="TestUser - 1",
#                                  email="testuser123456789@gmail.com",
#                                  roleId=-1)
#                       )
#  dfp_createUsers_result <- dfp_createUsers(request_data)

