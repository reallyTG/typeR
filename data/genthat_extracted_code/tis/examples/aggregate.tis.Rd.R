library(tis)


### Name: aggregate.tis
### Title: Compute Summary Statistics of Time Series Subsets
### Aliases: aggregate.tis
### Keywords: ts

### ** Examples

z <- tis(1:24, start = latestJanuary()) ## a monthly series
aggregate(z, nf = 4, FUN = mean)        ## quarterly average
aggregate(z, nf = 1, FUN = function(x) x[length(x)]) ## December is annual level



