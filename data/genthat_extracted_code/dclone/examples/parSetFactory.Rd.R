library(dclone)


### Name: parSetFactory
### Title: Advanced control over JAGS on parallel workers
### Aliases: parListFactories parSetFactory
### Keywords: models

### ** Examples

## Not run: 
##D if (require(rjags)) {
##D cl <- makePSOCKcluster(3)
##D parListFactories(cl, "sampler")
##D parListFactories(cl, "monitor")
##D parListFactories(cl, "rng")
##D parSetFactory(cl, "base::Slice", "sampler", FALSE)
##D parListFactories(cl, "sampler")
##D parSetFactory(cl, "base::Slice", "sampler", TRUE)
##D stopCluster(cl)
##D }
## End(Not run)



