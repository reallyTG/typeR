library(agridat)


### Name: jenkyn.mildew
### Title: Yields from treatment for mildew control
### Aliases: jenkyn.mildew
### Keywords: datasets

### ** Examples


data(jenkyn.mildew)
dat <- jenkyn.mildew

require(lattice)
bwplot(yield ~ trt, dat, main="jenkyn.mildew", xlab="Treatment")

# Residuals from treatment model show obvious spatial trends
m0 <- lm(yield ~ trt, dat)
xyplot(resid(m0)~plot, dat, ylab="Residual",
       main="jenkyn.mildew - treatment model")

# The blocks explain most of the variation
m1 <- lm(yield ~ trt + block, dat)
xyplot(resid(m1)~plot, dat, ylab="Residual",
       main="jenkyn.mildew - block model")




