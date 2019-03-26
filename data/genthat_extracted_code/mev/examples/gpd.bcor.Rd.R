library(mev)


### Name: gpd.bcor
### Title: Bias correction for GP distribution using Firth's modified score
###   function or bias substraction
### Aliases: gpd.bcor

### ** Examples

set.seed(1)
dat <- evd::rgpd(n=40, scale=1, shape=-0.2)
par <- gp.fit(dat, threshold=0, show=FALSE)$estimate
gpd.bcor(par,dat, "subtract")
gpd.bcor(par,dat, "firth") #observed information
gpd.bcor(par,dat, "firth","exp")



