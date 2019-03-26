library(timeSeries)


### Name: orderStatistics
### Title: order Statistics
### Aliases: orderStatistics
### Keywords: chron

### ** Examples

## Load Swiss Pension Fund Benchmark Data -  
   setRmetricsOptions(myFinCenter = "GMT")
   X <- LPP2005REC[, "SPI"]
   colnames(X)
   
## Compute 1% Order Statistics -
   N <- round(0.01*nrow(X))
   N
   OS <- orderStatistics(X)[[1]]
   OS[1:N, ]



