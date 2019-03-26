library(mirt)


### Name: M2
### Title: Compute the M2 model fit statistic
### Aliases: M2
### Keywords: fit model

### ** Examples

## Not run: 
##D dat <- as.matrix(expand.table(LSAT7))
##D (mod1 <- mirt(dat, 1))
##D M2(mod1)
##D M2(mod1, residmat=TRUE) #lower triangle of residual correlation matrix
##D 
##D #M2 imputed with missing data present (run in parallel)
##D dat[sample(1:prod(dim(dat)), 250)] <- NA
##D mod2 <- mirt(dat, 1)
##D 
##D # compute stats using conservative model imputations
##D mirtCluster()
##D M2(mod2, impute = 10)
##D 
##D # or compute stats by removing missing data row-wise
##D M2(mod2, na.rm = TRUE)
##D 
##D # C2 statistic (useful when polytomous IRT models have too few df)
##D pmod <- mirt(Science, 1)
##D # This fails with too few df:
##D # M2(pmod)
##D # This, however, works:
##D M2(pmod, type = 'C2')
##D 
## End(Not run)



