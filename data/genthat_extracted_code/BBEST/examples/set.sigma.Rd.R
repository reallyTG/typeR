library(BBEST)


### Name: set.sigma
### Title: Set the experimental uncertainty
### Aliases: set.sigma
### Keywords: set data

### ** Examples

# Setting x and y
x <- seq(.7, 30, 0.01)
y <- sin(x) 
# Adding x-dependent noise
y <- y + rnorm(sd=0.05+x/240, n=length(x))

# estimating noise
dat <- list(x=x, y=y)
dat <- set.sigma(dat, n.regions=1)
# use
# dat <- set.sigma(dat, n.regions=5)
# to see the difference


# Plotting results: noisy function and a
# smoothed estimate +/- 2 standard deviations
plot(x, y, t="l")
lines(dat$x, dat$smoothed, col=3, lwd=2)
lines(dat$x, dat$smoothed+2*dat$sigma, col=2)
lines(dat$x, dat$smoothed-2*dat$sigma, col=2)
abline(v=seq(min(x), max(x),length=5), col=4)




