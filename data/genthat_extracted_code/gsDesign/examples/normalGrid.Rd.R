library(gsDesign)


### Name: normalGrid
### Title: 3.1: Normal Density Grid
### Aliases: normalGrid
### Keywords: design

### ** Examples

#  standard normal distribution
x <- normalGrid(r=3)
plot(x$z, x$wgts)

#  verify that numerical integration replicates sigma
#  get grid points and weights
x <- normalGrid(mu=2, sigma=3)

# compute squared deviation from mean for grid points
dev <- (x$z-2)^2

# multiply squared deviations by integration weights and sum 
sigma2 <- sum(dev * x$wgts)

# square root of sigma2 should be sigma (3)
sqrt(sigma2)

# do it again with larger r to increase accuracy
x <- normalGrid(r=22, mu=2, sigma=3)
sqrt(sum((x$z - 2)^2 * x$wgts))

# this can also be done by combining gridwgts and density
sqrt(sum((x$z - 2)^2 * x$gridwgts * x$density))

# integrate normal density and compare to built-in function
# to compute probability of being within 1 standard deviation
# of the mean
pnorm(1)-pnorm(-1)
x <- normalGrid(bounds=c(-1, 1))
sum(x$wgts)
sum(x$gridwgts * x$density)

# find expected sample size for default design with
# n.fix=1000
x <- gsDesign(n.fix=1000)
x

# set a prior distribution for theta
y <- normalGrid(r=3, mu=x$theta[2], sigma=x$theta[2] / 1.5)
z <- gsProbability(k=3, theta=y$z, n.I=x$n.I, a=x$lower$bound,
                   b=x$upper$bound)
z <- gsProbability(d=x, theta=y$z)
cat("Expected sample size averaged over normal\n prior distribution for theta with \n mu=", 
   x$theta[2], "sigma=", x$theta[2]/1.5, ":",
   round(sum(z$en*y$wgt), 1), "\n")
plot(y$z, z$en, xlab="theta", ylab="E{N}", 
   main="Expected sample size for different theta values")
lines(y$z, z$en)



