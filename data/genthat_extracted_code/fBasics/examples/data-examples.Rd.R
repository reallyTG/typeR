library(fBasics)


### Name: fBasicsData
### Title: fBsiscs Data Sets
### Aliases: fBasicsData Capitalization cars2 DowJones30 HedgeFund msft.dat
###   nyse PensionFund swissEconomy SWXLP usdthb .HedgeFund1 .HedgeFund2
### Keywords: datasets

### ** Examples

## Plot DowJones30 Example Data Set
   series <- as.timeSeries(DowJones30)
   head(series)
   plot(series[,1:6], type = "l")



