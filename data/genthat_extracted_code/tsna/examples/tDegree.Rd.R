library(tsna)


### Name: tDegree
### Title: Report momentary degree of a networkDynamic object at multiple
###   timepoints
### Aliases: tDegree

### ** Examples

data(McFarland_cls33_10_16_96)
tDegree(cls33_10_16_96)
# compute mean temporal degree
mean(tDegree(cls33_10_16_96),na.rm=TRUE)
## Not run: 
##D library(networkDynamicData)
##D data(concurrencyComparisonNets)
##D # compute mean for each network, sampled at 11 time points
##D mean(colMeans(tDegree(base,start = 0,end=102,time.interval = 10)))
##D mean(colMeans(tDegree(middle,start = 0,end=102,time.interval = 10)))
##D mean(colMeans(tDegree(monog,start = 0,end=102,time.interval = 10)))
##D 
##D # plot distribution of vertices' mean momentary degree
##D hist(rowMeans(tDegree(base,start = 0,end=102,time.interval = 10)))
##D 
##D # plot distribution of momentary degrees of vertices
##D hist(tDegree(base,start = 0,end=102,time.interval = 10))
## End(Not run)




