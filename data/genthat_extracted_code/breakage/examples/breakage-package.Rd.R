library(breakage)


### Name: breakage-package
### Title: Estimating SICM pipette tip geometry from breakage data
### Aliases: breakage-package breakage
### Keywords: package

### ** Examples

# load the example data set
data("break.data")

# get the bottom points
raw.points <- breakage.plot(break.data, mV=100)
## Not run: 
##D # select the clusters
##D clustered <- break.clust(raw.points)
##D 
##D # fit the tip geometry to the clustered points
##D fit <- fit.breakage(clustered, rho=64)
## End(Not run)



