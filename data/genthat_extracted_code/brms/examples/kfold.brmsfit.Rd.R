library(brms)


### Name: kfold.brmsfit
### Title: K-Fold Cross-Validation
### Aliases: kfold.brmsfit kfold

### ** Examples

## Not run: 
##D fit1 <- brm(count ~ zAge + zBase * Trt + (1|patient) + (1|obs),
##D            data = epilepsy, family = poisson())
##D # throws warning about some pareto k estimates being too high
##D (loo1 <- loo(fit1))
##D # perform 10-fold cross validation
##D (kfold1 <- kfold(fit1, chains = 1)
##D 
##D # use the future package for parallelization
##D library(future)
##D plan(multiprocess)
##D kfold(fit1, chains = 1)
## End(Not run)   
 



