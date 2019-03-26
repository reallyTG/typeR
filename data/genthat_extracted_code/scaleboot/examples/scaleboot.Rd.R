library(scaleboot)


### Name: scaleboot
### Title: Multiscale Bootstrap Resampling
### Aliases: scaleboot countw.assmax countw.shtest countw.shtestass
### Keywords: nonparametric

### ** Examples

## Not run: 
##D ## An example to calculate AU p-values for phylogenetic trees
##D ## See also the Examples of "sbconf"
##D data(mam15) # load mam15.mt
##D sa <- 9^seq(-1,1,length=13) # parameter for multiscale bootstrap
##D nb <- 1000 # nb=10000 is better but slower
##D # Now compute bootstrap probabilities and fit models to them
##D sim <- scaleboot(mam15.mt,nb,sa,countw.assmax) # takes some time (< 1 min)
##D sim # show bootstrap probabilities and model fitting
##D summary(sim) # show AU p-vaslues
## End(Not run)

## Not run: 
##D ## The following lines are only for illustration purpose
##D ## a line from the definition of relltest
##D scaleboot(dat,nb,sa,countw.assmax,ass,cluster=cluster,
##D                  names.hp=na,nofit=nofit,models=models,seed=seed)
##D 
##D ## two lines from rell.shtest (internal function)
##D scaleboot(z,nb,1,countw.shtest,tobs,cluster=cluster,
##D                  onlyboot=TRUE,seed=seed)
##D scaleboot(z,nb,1,countw.shtestass,pa,cluster=cluster,
##D                  onlyboot=TRUE,seed=seed)
## End(Not run)



