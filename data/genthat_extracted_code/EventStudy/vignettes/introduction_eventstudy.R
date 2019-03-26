## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE
)

## ---- eval=FALSE---------------------------------------------------------
#  apiUrl <- "http://api.eventstudytools.com"
#  apiKey <- "Please insert your key here"

## ---- eval=FALSE---------------------------------------------------------
#  # The URL is already set by default
#  # options(EventStudy.URL = apiUrl)
#  options(EventStudy.KEY = apiKey)
#  
#  # use EventStudy estAPIKey function
#  estAPIKey(apiKey)
#  
#  # initialize object
#  estSetup <- EventStudyAPI$new()

## ---- eval=FALSE---------------------------------------------------------
#  # Setup API Connection
#  estSetup <- EventStudyAPI$new(apiUrl)
#  estSetup$authentication(apiKey)

## ---- eval=FALSE---------------------------------------------------------
#  estType <- "arc"

## ---- eval=FALSE---------------------------------------------------------
#  dataFiles <- c("request_file" = "01_RequestFile.csv",
#                 "firm_data"    = "02_firmData.csv",
#                 "market_data"  = "03_MarketData.csv")

## ---- eval=FALSE---------------------------------------------------------
#  resultPath <- "results"

## ---- eval=FALSE---------------------------------------------------------
#  estResult <- estSetup$performDefaultEventStudy(estType    = estType,
#                                                 dataFiles  = dataFiles,
#                                                 destDir    = resultPath)

## ---- message=FALSE, warning=FALSE, results='hide'-----------------------
library(EventStudy)
getSP500ExampleFiles()

## ---- message=FALSE------------------------------------------------------
library(readr)
df <- readr::read_delim("01_RequestFile.csv", col_names = F, delim = ";")
names(df) <- c("Event ID", "Firm ID", "Market ID", "Event Date", "Grouping Variable", "Start Event Window", "End Event Window", "End of Estimation Window", "Estimation Window Length")
knitr::kable(head(df), pad=0)

## ---- message=FALSE------------------------------------------------------
library(readr)
df <- readr::read_delim("02_FirmData.csv", col_names = F, delim = ";")
names(df) <- c("Firm ID", "Date", "Closing Price")
knitr::kable(head(df))

## ---- message=FALSE------------------------------------------------------
library(readr)
df <- readr::read_delim("03_MarketData.csv", col_names = F, delim = ";")
names(df) <- c("Market ID", "Date", "Closing Price")
knitr::kable(head(df))

