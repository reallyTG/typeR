library(replyr)


### Name: replyr_quantilec
### Title: Compute quantiles on remote column (NA's filtered out) using
###   cumsum.
### Aliases: replyr_quantilec

### ** Examples


d <- data.frame(xvals=rev(1:1000))
replyr_quantilec(d,'xvals')




