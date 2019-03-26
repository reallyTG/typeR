library(fdadensity)


### Name: lqd2quantile
### Title: Function for converting log quantile densities to quantile
###   functions
### Aliases: lqd2quantile

### ** Examples

x <- seq(1,3,length.out =512)
y.lqd <- rep(log(2), times = 512)
y <- lqd2quantile(lqd = y.lqd, lb = 1) # should equate # seq(1, 3, length.out = 512)



