library(drmdel)


### Name: densityDRM
### Title: Estimate the density of the populations under the DRM
### Aliases: densityDRM
### Keywords: methods

### ** Examples

# Data generation
set.seed(25)
n_samples <- c(100, 200, 180, 150, 175)  # sample sizes
x0 <- rgamma(n_samples[1], shape=5, rate=1.8)
x1 <- rgamma(n_samples[2], shape=12, rate=1.2)
x2 <- rgamma(n_samples[3], shape=12, rate=1.2)
x3 <- rgamma(n_samples[4], shape=18, rate=5)
x4 <- rgamma(n_samples[5], shape=25, rate=2.6)
x <- c(x0, x1, x2, x3, x4)

# Fit a DRM with the basis function q(x) = (x, log(abs(x))),
# which is the basis function for gamma family. This basis
# function is the built-in basis function 6.
drmfit <- drmdel(x=x, n_samples=n_samples, basis_func=6)

# Estimate the density of population 3 under the DRM
dens_pop3 <- densityDRM(k=3, drmfit=drmfit)

# Plot the estimated density
plot(dens_pop3, main=bquote(F[3]), ylim=range(c(0, 0.5)))

# Add the empirical kernel density estimation curve of F_3
# based on the third sample on the above density plot
lines(density(x3), col="blue", lty="28F8")

# Add the true density curve of F_3 on the above density
# plot
lines(seq(min(dens_pop3$y), max(dens_pop3$x), 0.01),
      dgamma(seq(min(dens_pop3$y), max(dens_pop3$x), 0.01),
             18, 5),
      type="l", col="red", lty="dotted")

legend(9, 0.5,
       legend=c("DRM density estimator",
                "Empirical kernel density estimator",
                "True density"),
       col=c("black", "blue", "red"),
       lty=c("solid", "28F8", "dotted"))



