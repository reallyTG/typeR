library(pbkrtest)


### Name: pb-refdist
### Title: Calculate reference distribution using parametric bootstrap
### Aliases: PBrefdist PBrefdist.lm PBrefdist.mer PBrefdist.merMod
###   pb-refdist
### Keywords: inference models

### ** Examples


data(beets)
head(beets)
beet0 <- lmer(sugpct ~ block + sow + harvest + (1|block : harvest), data=beets, REML=FALSE)
beet_no.harv <- update(beet0, .~.-harvest)
rr <- PBrefdist(beet0, beet_no.harv, nsim=20)
rr

## Note: Many more simulations must be made in practice.

## Computations can be made in parallel using several processors:
## Not run: 
##D cl <- makeSOCKcluster(rep("localhost", 4))
##D clusterEvalQ(cl, library(lme4))
##D clusterSetupSPRNG(cl)
##D rr <- PBrefdist(beet0, beet_no.harv, nsim=20)
##D stopCluster(cl)
## End(Not run)
## Above, 4 cpu's are used and 5 simulations are made on each cpu.




