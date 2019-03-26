## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----Export, eval=FALSE--------------------------------------------------
#  library(baytrends)
#  
#  # load the included data frame, dataCensored, into the global environment
#  # dataCensored is a sample data set that includes qw formatted data and
#  # is included with baytrends.
#  myDF <- dataCensored
#  
#  # identify the current working directory as the location to save
#  # the outputted data set
#  dir.save <- getwd()
#  
#  # identify the name of the comma delimited (csv) file for the
#  # outputted data set
#  fn.output <- "dataCensored_TEST.csv"
#  
#  # run function
#  qw.export(myDF, dir.save, fn.output)

## ----RawDataFormat_SHOW, eval=FALSE--------------------------------------
#  df <- read.csv("dataCensored_TEST.csv")
#  head(df[,c(1:3,16:24)])

## ----RawDataFormat_RUN, eval=TRUE, echo=FALSE, warning=FALSE, message=FALSE----
library(baytrends)
library(knitr)
# Use internal function to export dataCensored as example for import
#qw.export(dataCensored, file.path(getwd(),"data"), "dataCensored_TEST.csv")

df <- read.csv(file.path(getwd(),"data", "dataCensored_TEST.csv"))

knitr::kable(head(df[,c(1:3,16:24)]))

## ----Import, eval=FALSE--------------------------------------------------
#  library(baytrends)
#  
#  # Define function arguments
#  fn.import <- "dataCensored_TEST.csv"
#  qw.names <- c("secchi" ,  "salinity", "do"  ,     "wtemp"  ,  "chla"
#                ,"tn"     ,  "tp"    ,   "tss" ,     "din"  ,    "po4"
#                ,"tdn"     , "tdp"  ,    "nh4"  ,    "no23")
#  
#  # fun function
#  dataCensored.test<- qw.import(fn.import, qw.names)
#  
#  # Check for qw class
#  str(dataCensored.test)
#  
#  # convert date field to POSIXct
#  dataCensored.test[,"date"] <- as.POSIXct(dataCensored.test[,"date"])
#  
#  # recheck structure (other columns can be converted using
#  # as.numeric() and as.integer() if desired)
#  str(dataCensored.test)
#  
#  # save the data frame for future use
#  save(dataCensored.test, file="dataCensored.test.rda")

## ----rbindData, eval=FALSE-----------------------------------------------
#  library(baytrends)
#  
#  newDF <- rbindQW(dataCensored[1:20,], dataCensored[101:120,])
#  head(newDF)
#  
#  # Note, that it would have been equivalent and more efficient to
#  # use the below line of code to extract rows 1-20 and 101-120
#  newDF <- dataCensored[c(1:20,101:120),]

