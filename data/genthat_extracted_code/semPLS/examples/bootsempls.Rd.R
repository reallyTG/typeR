library(semPLS)


### Name: bootsempls
### Title: Bootstrap a PLS path model
### Aliases: bootsempls print.bootsempls summary.bootsempls
###   print.summary.bootsempls densityplot.bootsempls
###   parallelplot.bootsempls parallel.bootsempls

### ** Examples

## Not run: 
##D data(ECSImobi)
##D ecsi <- sempls(model=ECSImobi, data=mobi)
##D 
##D ### Bootstrapping
##D set.seed(123)
##D ecsiBoot <- bootsempls(ecsi, nboot=200, start="ones", verbose=TRUE)
##D summary(ecsiBoot, type="perc", level=0.95)
##D 
##D 
##D 
##D ## inspectation of bootstrap samples
##D parallelplot(ecsiBoot, subset=1:ncol(ecsiBoot$t), reflinesAt=0)
##D 
##D # only inspecting the path coefficients
##D parallelplot(ecsiBoot, pattern="beta", reflinesAt=c(0,1))
##D densityplot(ecsiBoot, pattern="beta")
##D 
##D # only inspecting the outer loadings
##D parallelplot(ecsiBoot, pattern="lam")
##D 
##D # only inspecting the outer loadings for Loyalty
##D parallelplot(ecsiBoot, pattern="lam7", type="perc", level=0.90,
##D          main="Loyalty\n 200 bootstrapped outer loadings")
## End(Not run)



