library(simba)


### Encoding: UTF-8

### Name: rin
### Title: Calculate multiple plot resemblance measures
### Aliases: rin mpd mps mps.ave mos.f mos.ft sos
### Keywords: multivariate htest array

### ** Examples

## Not run: 
##D # load the data that comes with the package
##D data(abis)
##D 
##D # calculate a multiple plot similarity index 
##D # (Sørensen sensu Baselga) for whole dataset
##D mpd(abis.spec, method="sorensen")
##D 
##D # calculate a multiple plot similarity index
##D # (Sørensen sensu Baselga) for each plot and 
##D # its neighborhood
##D abis.mpd.so <- rin(abis.spec, coord=abis.env[,1:2], 
##D dn=100, func="mpd(x, method='sorensen')")
##D 
##D # plot the grid of plots and show the calculated 
##D # multiple plot dissimilarity value through the 
##D # size of the symbol and the sign of the value
##D # with a superimposed "+" or "-"
##D with(abis.mpd.so , {
##D plot(abis.env[,1:2], cex=symbol.size(dis), pch=c(21,1)[sig], 
##D 	bg="grey50", xlab="", ylab="")
##D subs <- sig == "*"
##D points(abis.env[subs,1:2], pch=c("-", "+")[sig.prefix[subs]])
##D })
##D 
##D # calculate a multiple plot similarity index
##D # that takes care of the species composition
##D # on the focal plot
##D rin(abis.spec, coord=abis.env[,1:2], test=FALSE,
##D dn=100, func="mos.f(x, foc=foc)")
## End(Not run)



