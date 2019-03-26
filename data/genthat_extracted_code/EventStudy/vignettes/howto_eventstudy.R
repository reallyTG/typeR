## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- message=F, echo=T, eval=FALSE--------------------------------------
#  library(tidyquant)
#  library(dplyr)
#  library(readr)

## ---- eval=FALSE---------------------------------------------------------
#  startDate <- "2014-05-01"
#  endDate <- "2015-12-31"

## ---- eval=FALSE---------------------------------------------------------
#  # Firm Data
#  firmSymbols <- c("VOW.DE", "NSU.DE", "PAH3.DE", "BMW.DE", "DAI.DE")
#  firmNames <- c("VW preferred", "Audi", "Porsche Automobil Hld", "BMW", "Daimler")
#  firmSymbols %>%
#    tidyquant::tq_get(from = startDate, to = endDate) %>%
#    dplyr::mutate(date = format(date, "%d.%m.%Y")) -> firmData
#  knitr::kable(head(firmData), pad=0)

## ---- eval=FALSE---------------------------------------------------------
#  # Index Data
#  indexSymbol <- c("^GDAXI")
#  indexName <- c("DAX")
#  indexSymbol %>%
#    tidyquant::tq_get(from = startDate, to = endDate) %>%
#    dplyr::mutate(date = format(date, "%d.%m.%Y")) -> indexData
#  indexData$symbol <- "DAX"
#  knitr::kable(head(indexData), pad=0)

## ---- eval=FALSE---------------------------------------------------------
#  # Price files for firms and market
#  firmData %>%
#    dplyr::select(symbol, date, adjusted) %>%
#    readr::write_delim(path      = "02_firmDataPrice.csv",
#                       delim     = ";",
#                       col_names = F)
#  
#  indexData %>%
#    dplyr::select(symbol, date, adjusted) %>%
#    readr::write_delim(path      = "03_marketDataPrice.csv",
#                       delim     = ";",
#                       col_names = F)
#  
#  # Volume files for firms and market
#  firmData %>%
#    dplyr::select(symbol, date, volume) %>%
#    readr::write_delim(path      = "02_firmDataVolume.csv",
#                       delim     = ";",
#                       col_names = F)
#  
#  indexData %>%
#    dplyr::select(symbol, date, volume) %>%
#    readr::write_delim(path      = "03_marketDataVolume.csv",
#                       delim     = ";",
#                       col_names = F)

## ---- eval=FALSE---------------------------------------------------------
#  group <- c(rep("VW Group", 3), rep("Other", 2))
#  request <- cbind(c(1:5), firmSymbols, rep(indexName, 5), rep("18.09.2015", 5), group, rep(-10, 5), rep(10, 5), rep(-11, 5), rep(250, 5))
#  request %>%
#    as.data.frame() %>%
#    readr::write_delim("01_requestFile.csv", delim = ";", col_names = F)

## ---- message=F, eval=F--------------------------------------------------
#  key <- "573e58c665fcc08cc6e5a660beaad0cb"
#  
#  library(EventStudy)
#  est <- EventStudyAPI$new()
#  est$authentication(apiKey = key)
#  
#  # get & set parameters for abnormal return Event Study
#  # we use a garch model and csv as return
#  # Attention: fitting a GARCH(1, 1) model is compute intensive
#  esaParams <- EventStudy::ARCApplicationInput$new()
#  esaParams$setResultFileType("csv")
#  esaParams$setBenchmarkModel("garch")
#  
#  dataFiles <- c("request_file" = "01_requestFile.csv",
#                 "firm_data"    = "02_firmDataPrice.csv",
#                 "market_data"  = "03_marketDataPrice.csv")
#  
#  # check data files, you can do it also in our R6 class
#  EventStudy::checkFiles(dataFiles)
#  
#  # now let us perform the Event Study
#  arEventStudy <- est$performEventStudy(estParams     = esaParams,
#                                        dataFiles     = dataFiles,
#                                        downloadFiles = T)

## ---- eval=F-------------------------------------------------------------
#  knitr::kable(head(arEventStudy$arResults))

## ---- eval=F-------------------------------------------------------------
#  knitr::kable(head(arEventStudy$aarResults))

## ---- message=F, eval=F--------------------------------------------------
#  est <- EventStudyAPI$new()
#  est$authentication(apiKey = key)
#  
#  # get & set parameters for abnormal return Event Study
#  esaParams <- EventStudy::AVyCApplicationInput$new()
#  esaParams$setResultFileType("csv")
#  
#  avycEventStudy <- est$performEventStudy(estParams    = esaParams,
#                                         dataFiles     = dataFiles,
#                                         downloadFiles = T)

## ---- eval=F-------------------------------------------------------------
#  # est <- EventStudyAPI$new()
#  # est$authentication(apiKey = key)
#  #
#  # # get & set parameters for abnormal return Event Study
#  # esaParams <- EventStudy::AVCApplicationInput$new()
#  # esaParams$setResultFileType("csv")
#  #
#  # avEventStudy <- est$performEventStudy(estParams = esaParams,
#  #                       dataFiles = c("request_file" = "01_requestFile.csv",
#  #                                     "firm_data"    = "02_firmDataVolume.csv",
#  #                                     "market_data"  = "03_marketDataVolume.csv"))

