library(mirt)


### Name: boot.LR
### Title: Parametric bootstrap likelihood-ratio test
### Aliases: boot.LR
### Keywords: bootstrap parametric

### ** Examples


## Not run: 
##D 
##D #standard
##D dat <- expand.table(LSAT7)
##D mod1 <- mirt(dat, 1)
##D mod2 <- mirt(dat, 1, '3PL')
##D 
##D # standard LR test
##D anova(mod1, mod2)
##D 
##D # bootstrap LR test (run in parallel to save time)
##D mirtCluster()
##D boot.LR(mod1, mod2, R=200)
##D 
## End(Not run)



