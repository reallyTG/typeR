library(fdadensity)


### Name: dens2lqd
### Title: Function for converting densities to log quantile density
###   functions
### Aliases: dens2lqd

### ** Examples

x <- seq(0,2,length.out =512)
y <- rep(0.5,length.out =512)
y.lqd <- dens2lqd( dens=y, dSup = x) # should equate # log(2)



