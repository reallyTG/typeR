library(timeSeries)


### Name: rank
### Title: Sample Ranks of a Time Series
### Aliases: rank,timeSeries-method
### Keywords: chron

### ** Examples

## Load Microsoft Data -
   X <- 100 * returns(MSFT)

## Compute the Ranks -
   head(rank(X[, "Open"]), 10)
   
## Only Interested in the Vector, then use -
   head(rank(series(X[, "Open"])), 10)



