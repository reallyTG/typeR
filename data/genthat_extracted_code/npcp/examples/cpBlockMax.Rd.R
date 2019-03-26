library(npcp)


### Name: cpBlockMax
### Title: Nonparametric Tests for Change-Point Detection in the
###   Distribution of Independent Block Maxima
### Aliases: cpBlockMax
### Keywords: htest nonparametric ts

### ** Examples

## Not run: 
##D require(evd)
##D n <- 100
##D k <- 50 ## the true change-point
##D 
##D ## Change in the shape parameter of a GEV
##D x <- rgev(k,loc=0,scale=1,shape=-0.8)
##D y <- rgev(k,loc=0,scale=1,shape=0.4)
##D cp <- cpBlockMax(c(x,y))
##D cp
##D ## Estimated change-point
##D which(cp$stats.shape == max(cp$stats.shape))
##D 
##D ## Change in the scale parameter of a GEV
##D x <- rgev(k,loc=0,scale=0.5,shape=0)
##D y <- rgev(k,loc=0,scale=1,shape=0)
##D cp <- cpBlockMax(c(x,y))
##D cp
##D ## Estimated change-point
##D which(cp$stats.scale == max(cp$stats.scale))
##D 
##D ## Change in the location parameter of a GEV
##D x <- rgev(k,loc=0,scale=1,shape=0)
##D y <- rgev(k,loc=0.5,scale=1,shape=0)
##D cp <- cpBlockMax(c(x,y))
##D cp
##D ## Estimated change-point
##D which(cp$stats.loc == max(cp$stats.loc))
## End(Not run)



