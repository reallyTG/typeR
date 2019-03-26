library(adegenet)


### Name: DAPC cross-validation
### Title: Cross-validation for Discriminant Analysis of Principal
###   Components (DAPC)
### Aliases: xvalDapc xvalDapc.default xvalDapc.data.frame xvalDapc.matrix
###   xvalDapc.genlight xvalDapc.genind
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## CROSS-VALIDATION ##
##D data(sim2pop)
##D xval <- xvalDapc(sim2pop@tab, pop(sim2pop), n.pca.max=100, n.rep=3)
##D xval
##D 
##D ## 100 replicates ##
##D 
##D # Serial version (SLOW!)
##D system.time(xval <- xvalDapc(sim2pop@tab, pop(sim2pop), n.pca.max=100, n.rep=100))
##D 
##D # Parallel version (faster!)
##D system.time(xval <- xvalDapc(sim2pop@tab, pop(sim2pop), n.pca.max=100, n.rep=100, 
##D                              parallel = "multicore", ncpus = 2))
## End(Not run)



