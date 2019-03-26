library(bayou)


### Name: load.bayou
### Title: Loads a bayou object
### Aliases: load.bayou

### ** Examples

## Not run: 
##D data(chelonia)
##D tree <- chelonia$phy
##D dat <- chelonia$dat
##D prior <- make.prior(tree)
##D fit <- bayou.mcmc(tree, dat, model="OU", prior=prior, 
##D                                  new.dir=TRUE, ngen=5000)
##D chain <- load.bayou(fit, save.Rdata=FALSE, cleanup=TRUE)
##D plot(chain)
## End(Not run)



