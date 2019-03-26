library(nFactors)


### Name: moreStats
### Title: Statistical Summary of a Data Frame
### Aliases: moreStats
### Keywords: multivariate

### ** Examples

## GENERATION OF A MATRIX OF 100 OBSERVATIONS AND 10 VARIABLES
 x   <- matrix(rnorm(1000),ncol=10)

## STATISTICS
 res <- moreStats(x, quantile=0.05, show=TRUE)
 res
 


