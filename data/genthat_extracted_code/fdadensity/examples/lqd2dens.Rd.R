library(fdadensity)


### Name: lqd2dens
### Title: Function for converting log quantile densities to densities
### Aliases: lqd2dens

### ** Examples

x <- seq(0,2,length.out =512)
y.lqd <- rep(log(2), times = 512)
y <- lqd2dens(dSup=x, lqd = y.lqd) # should equate # 1/2



