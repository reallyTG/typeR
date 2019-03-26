library(clusterSEs)


### Name: cluster.im.mlogit
### Title: Cluster-Adjusted Confidence Intervals And p-Values For mlogit
### Aliases: cluster.im.mlogit

### ** Examples

## Not run: 
##D 
##D # example: predict type of heating system installed in house
##D require(mlogit)
##D data("Heating", package = "mlogit")
##D H <- Heating
##D H.ml <- mlogit.data(H, shape="wide", choice="depvar", varying=c(3:12))
##D m <- mlogit(depvar~ic+oc, H.ml)
##D 
##D # compute cluster-adjusted p-values
##D cluster.im.h <- cluster.im.mlogit(m, H.ml, ~ region)
##D 
## End(Not run)



