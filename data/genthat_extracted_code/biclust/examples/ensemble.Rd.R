library(biclust)


### Name: ensemble
### Title: Ensemble Methods for Bicluster Algorithms
### Aliases: ensemble
### Keywords: cluster

### ** Examples

## Don't show: 
data(BicatYeast)
x <- binarize(BicatYeast)
ensemble.bimax <- ensemble(x,bimax.grid(),rep=10,maxNum=2,thr=0.5, subs = c(0.8,0.8))
ensemble.bimax
## End(Don't show)
## Not run: 
##D data(BicatYeast)
##D ensemble.plaid <- ensemble(BicatYeast,plaid.grid()[1:5],rep=1,maxNum=2, thr=0.5, subs = c(1,1))
##D ensemble.plaid
##D x <- binarize(BicatYeast)
##D ensemble.bimax <- ensemble(x,bimax.grid(),rep=10,maxNum=2,thr=0.5, subs = c(0.8,0.8))
##D ensemble.bimax
## End(Not run)



