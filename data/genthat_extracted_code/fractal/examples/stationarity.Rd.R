library(fractal)


### Name: stationarity
### Title: Testing for stationarity in a time series
### Aliases: stationarity as.list.stationarity print.stationarity
###   print.summary.stationarity summary.stationarity
### Keywords: univar ts htest

### ** Examples

## assess the stationarity of the ecgrr series 
z <- stationarity(ecgrr, n.block=8)

## print the result, noting that all tests fail. 
## The strongest failure attributed to the 
## time-based fluctations of the eigenspectra 
print(z)

## print a summary of the results, including the 
## ANOVA table of the eigenspectra 
summary(z)



