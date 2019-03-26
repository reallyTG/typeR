## ---- echo = FALSE-------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  purl = NOT_CRAN,
  eval = NOT_CRAN
)

## ----load-package, eval=FALSE--------------------------------------------
#  library(rdfp)
#  options(rdfp.network_code = 123456789)
#  dfp_auth()

## ----auth, include = FALSE-----------------------------------------------
library(here)
library(rdfp)
token_path <- here::here("tests", "testthat", "rdfp_token.rds")
suppressMessages(dfp_auth(token = token_path, verbose = FALSE))
options_path <- here::here("tests", "testthat", "rdfp_options.rds")
rdfp_options <- readRDS(options_path)
options(rdfp.network_code = rdfp_options$network_code)

## ----eval=FALSE----------------------------------------------------------
#  request_data <- list('filterStatement'=list('query'="WHERE name = 'TestCompany1'"))
#  dfp_getCompaniesByStatement_result <- dfp_getCompaniesByStatement(request_data)
#  
#  request_data <- list(list(name='TestOrder',
#                            startDateTime=list(date=list(year=2018, month=12, day=1),
#                                               hour=0,
#                                               minute=0,
#                                               second=0,
#                                               timeZoneID='America/New_York'),
#                            endDateTime=list(date=list(year=2018, month=12, day=31),
#                                             hour=23,
#                                             minute=59,
#                                             second=59,
#                                             timeZoneID='America/New_York'),
#                            notes='API Test Order',
#                            externalOrderId=99999,
#                            advertiserId=dfp_getCompaniesByStatement_result$id,
#                            traffickerId=dfp_getCurrentUser()$id))
#  dfp_createOrders_result <- dfp_createOrders(request_data)

## ------------------------------------------------------------------------
# retrieve 3 line items that have a status of "DELIVERING"
request <- list('filterStatement'=list('query'="WHERE status='DELIVERING' LIMIT 3"))
resultset <- dfp_getLineItemsByStatement(request, as_df=TRUE)
resultset[,c('orderId', 'id', 'priority', 'deliveryRateType')]

