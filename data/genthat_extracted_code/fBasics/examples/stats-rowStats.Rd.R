library(fBasics)


### Name: rowStats
### Title: Row Statistics
### Aliases: rowStats rowSds rowVars rowSkewness rowKurtosis rowMaxs
###   rowMins rowProds rowQuantiles rowAvgs rowStdevs
### Keywords: univar

### ** Examples

## Simulated Return Data in Matrix Form:
   x = matrix(rnorm(10*10), nrow = 10)
     
## rowStats -
   rowStats(x, FUN = mean)
   
## rowMaxs -
   rowMaxs(x)  



