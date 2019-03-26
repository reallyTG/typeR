library(timeSeries)


### Name: colStats
### Title: Column Statistics
### Aliases: colStats colSums,timeSeries-method colMeans,timeSeries-method
###   colSds colVars colSkewness colKurtosis colMaxs colMins colProds
###   colQuantiles colAvgs colStdevs
### Keywords: univar

### ** Examples

## Simulated Return Data in Matrix Form -
   x = matrix(rnorm(252), ncol = 2)
     
## Mean Columnwise Statistics -
   colStats(x, FUN = mean)
   
## Quantiles Column by Column -
   colQuantiles(x, prob = 0.10, type = 1)  



