library(robfilter)


### Name: wrm.filter
### Title: Weighted Repeated Median Filters for Univariate Time Series
### Aliases: wrm.filter
### Keywords: robust ts

### ** Examples

data(Nile)
nile <- as.numeric(Nile)
obj <- wrm.filter(nile, width=11)
plot(obj)



