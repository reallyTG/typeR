library(mclust)


### Name: mclustBootstrapLRT
### Title: Bootstrap Likelihood Ratio Test for the Number of Mixture
###   Components
### Aliases: mclustBootstrapLRT print.mclustBootstrapLRT
###   plot.mclustBootstrapLRT
### Keywords: htest cluster

### ** Examples

## Not run: 
##D data(faithful)
##D faithful.boot = mclustBootstrapLRT(faithful, model = "VVV")
##D faithful.boot
##D plot(faithful.boot, G = 1)
##D plot(faithful.boot, G = 2)
## End(Not run)



