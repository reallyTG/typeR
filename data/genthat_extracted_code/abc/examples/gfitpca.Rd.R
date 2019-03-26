library(abc)


### Name: gfitpca
### Title: Goodness of fit with principal component analysis
### Aliases: gfitpca

### ** Examples

## human demographic history
require(abc.data)
data(human)
## five R objects are loaded. See ?human and vignette("abc") for details.

## Perform a priori goodness of fit for 3 different demographic models
## The envelopes containing 90% of the simulations are displayed.
## For the European data, a reasonable fit is only provided by the 
## bottleneck model.
## The number of simulations is reduced to improve speed (do not do that
## with your own data)
index<-c(1:5000,50001:55000,100001:105000)
gfitpca(target=stat.voight["italian",], sumstat=stat.3pops.sim[index,],
index=models[index], cprob=0.1)



