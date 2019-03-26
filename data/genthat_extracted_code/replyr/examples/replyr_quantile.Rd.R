library(replyr)


### Name: replyr_quantile
### Title: Compute quantiles on remote column (NA's filtered out) using
###   binary search.
### Aliases: replyr_quantile

### ** Examples


d <- data.frame(xvals=rev(1:1000))
replyr_quantile(d,'xvals')




