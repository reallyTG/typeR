library(timeSeries)


### Name: isUnivariate
### Title: Checks if a Time Series is Univariate
### Aliases: isUnivariate isMultivariate
### Keywords: chron

### ** Examples

## Load Microsoft Data - 
   setRmetricsOptions(myFinCenter = "GMT")
   data(MSFT)
   Open = MSFT[, "Open"]
  
## Is the timeSeries Univariate - 
   isUnivariate(MSFT)
   isUnivariate(Open)

## Is the timeSeries Multivariate -   
   isMultivariate(MSFT)
   isMultivariate(Open)



