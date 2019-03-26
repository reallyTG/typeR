library(mirt)


### Name: PLCI.mirt
### Title: Compute profiled-likelihood (or posterior) confidence intervals
### Aliases: PLCI.mirt
### Keywords: likelihood profiled

### ** Examples


## Not run: 
##D mirtCluster() #use all available cores to estimate CI's in parallel
##D dat <- expand.table(LSAT7)
##D mod <- mirt(dat, 1)
##D 
##D result <- PLCI.mirt(mod)
##D result
##D 
##D # model with constraints
##D mod <- mirt(dat, 'F = 1-5
##D                   CONSTRAIN = (1-5, a1)')
##D 
##D result <- PLCI.mirt(mod)
##D result
##D 
##D mod2 <- mirt(Science, 1)
##D result2 <- PLCI.mirt(mod2)
##D result2
##D 
##D #only estimate CI's slopes
##D sv <- mod2values(mod2)
##D parnum <- sv$parnum[sv$name == 'a1']
##D result3 <- PLCI.mirt(mod2, parnum)
##D result3
##D 
## End(Not run)



