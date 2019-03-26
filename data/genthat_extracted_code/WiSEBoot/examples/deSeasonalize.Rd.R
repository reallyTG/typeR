library(WiSEBoot)


### Name: deSeasonalize
### Title: De-seasonalize daily, monthly, or data series with IDs
### Aliases: deSeasonalize
### Keywords: arith manip

### ** Examples

ID <- as.Date(c("2014-05-14", "2013-06-20", "2013-05-14", "2012-06-20",
                "1999-09-09", "1998-09-08", "1998-09-09", "1982-05-14", 
                "2000-09-08"))
someData <- seq(1, 9)

deSeasonalize(dates=ID, X=someData, type="daily", method="deMean") 
deSeasonalize(dates=ID, X=someData, type="monthly", method="standardize")



