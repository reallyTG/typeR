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
options(rdfp.network_code = rdfp_options$test_network_code)

## ---- eval=FALSE---------------------------------------------------------
#  # this creates a label called "Auto - Competitive Exclusion" that we can add
#  # to any line item or order that we might want to use to prevent from clashing
#  # where two different car advertisers ads should not be shown at once.
#  request_data <- data.frame(name="Auto - Competitive Exclusion",
#                             description=paste0("A label to prevent two different car ",
#                                                "companies from showing ads together"),
#                             types='COMPETITIVE_EXCLUSION')
#  request_data <- list('labels'=hypothetical_label)
#  result <- dfp_createLabels(request_data)

## ---- eval=FALSE---------------------------------------------------------
#  # this creates an extra field on the CREATIVE entity type that denotes the time of
#  # day that the creative typically runs. First we create the field, then populate
#  # with potential options since it is a dropdown field.
#  request_data <- data.frame(name='Timing',
#                             description='The time of day that this creative usually runs.',
#                             entityType='CREATIVE',
#                             dataType='DROP_DOWN',
#                             visibility='FULL')
#  dfp_createCustomFields_result <- dfp_createCustomFields(request_data)
#  
#  request_data <- data.frame(customFieldId=rep(dfp_createCustomFields_result$id, 3),
#                             displayName=c('Morning', 'Afternoon', 'Evening'))
#  dfp_createCustomFieldOptions_result <- dfp_createCustomFieldOptions(request_data)

## ------------------------------------------------------------------------
# create the key
unique_numb <- as.integer(runif(1,1,100000))
request_data <- list(keys=list(name=paste0('Test', unique_numb), 
                               displayName=paste0('TestKey', unique_numb), 
                               type='FREEFORM'))
dfp_createCustomTargetingKeys_result <- dfp_createCustomTargetingKeys(request_data)
dfp_createCustomTargetingKeys_result

# create the values
request_data <- data.frame(customTargetingKeyId=rep(dfp_createCustomTargetingKeys_result$id,2),
                           name=c('TestValue1','TestValue2'), 
                           displayName=c('TestValue1','TestValue2'), 
                           matchType=rep('EXACT', 2))
dfp_createCustomTargetingValues_result <- dfp_createCustomTargetingValues(request_data)
dfp_createCustomTargetingValues_result

## ----cleanup2, include = FALSE-------------------------------------------
request_data <- list(customTargetingValueAction='DeleteCustomTargetingValues',
                     filterStatement=list('query'=sprintf("WHERE customTargetingKeyId = %s", 
                                                          dfp_createCustomTargetingKeys_result$id)))
res <- dfp_performCustomTargetingValueAction(request_data, as_df=FALSE)

request_data <- list(customTargetingKeyAction='DeleteCustomTargetingKeys',
                     filterStatement=list('query'=sprintf("WHERE Id = %s", 
                                                          dfp_createCustomTargetingKeys_result$id)))
res <- dfp_performCustomTargetingKeyAction(request_data, as_df=FALSE)

