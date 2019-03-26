library(breakage)


### Name: break.clust
### Title: Manually select point clusters from breakage data
### Aliases: break.clust

### ** Examples

# load the example data set
data("break.data")

# get the bottom points
raw.points <- breakage.plot( break.data, mV=100 )
## Not run: 
##D # select the clusters
##D clustered <- break.clust( raw.points )
## End(Not run)



