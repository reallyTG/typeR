library(ChainLadder)


### Name: getLatestCumulative
### Title: Triangle information for most recent calendar period.
### Aliases: getLatestCumulative
### Keywords: methods

### ** Examples

RAA
getLatestCumulative(RAA)
Y <- matrix(c(1,  2,  3,
              4,  5,  0, 
              6, NA, NA), byrow=TRUE, nrow=3)
getLatestCumulative(Y) # c(3, 0, 6) 
getLatestCumulative(Y, na.values = 0) # c(3, 5, 6) 



