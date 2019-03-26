## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  options(EventStudy.URL = "http://api.eventstudytools.com")

## ---- eval=FALSE---------------------------------------------------------
#  getOption("EventStudy.tryAttempts")

## ---- eval=FALSE---------------------------------------------------------
#  apiUrl <- "http://api.eventstudytools.com"
#  apiKey <- "Please insert your key here"
#  
#  # Setup API Connection
#  estSetup <- EventStudyAPI$new(apiUrl)
#  estSetup$authentication(apiKey)
#  
#  # Perform Event Study
#  estResults <- estSetup$performEventStudy(estParams     = volatilityEstParams,
#                                           dataFiles     = c("request_file" = "01_RequestFile.csv",
#                                                             "firm_data"    = "02_firmData.csv",
#                                                             "market_data"  = "03_marketData.csv"),
#                                           downloadFiles = T, # download result files
#                                           checkFiles    = T) # check input files

## ---- eval=FALSE---------------------------------------------------------
#  returnEstParams <- ARCApplicationInput$new()

## ---- eval=FALSE---------------------------------------------------------
#  returnEstParams$setResultFileType("xlsx")

## ---- eval=FALSE---------------------------------------------------------
#  returnEstParams$setReturnType("simple")

## ---- eval=FALSE---------------------------------------------------------
#  returnEstParams$setNonTradingDays("earlier")

## ---- eval=FALSE---------------------------------------------------------
#  returnEstParams <- ARCApplicationInput$new()

## ---- eval=FALSE---------------------------------------------------------
#  returnEstParams$setBenchmarkModel("mm-sw")

## ---- eval=FALSE---------------------------------------------------------
#  returnEstParams$setTestStatistics(c("aarptlz", "aarrankz"))

## ---- eval=FALSE---------------------------------------------------------
#  volumeEstParams <- AVCApplicationInput$new()

## ---- eval=FALSE---------------------------------------------------------
#  volumeEstParams$setBenchmarkModel("mm-sw")

## ---- eval=FALSE---------------------------------------------------------
#  volumeEstParams$setTestStatistics(c("aarptlz", "aarrankz"))

## ---- eval=FALSE---------------------------------------------------------
#  volatilityEstParams <- AVyCApplicationInput$new()

## ---- eval=FALSE---------------------------------------------------------
#  volatilityEstParams$setTestStatistics(c("aarptlz", "aarrankz"))

