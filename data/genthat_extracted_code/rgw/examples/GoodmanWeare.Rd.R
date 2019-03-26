library(rgw)


### Name: GoodmanWeare
### Title: Goodman-Weare Affine-Invariant Sampling
### Aliases: GoodmanWeare
### Keywords: htest

### ** Examples

# In this example, we'll sample from a simple 2D Gaussian

# Define the log-posterior function
lnP = function(x) sum( dnorm(x, c(0,1), c(pi, exp(0.5)), log=TRUE) )

# Initialize an ensemble of 100 walkers
nwalk = 100
ensemble = array(dim=c(2, nwalk))
ensemble[1,] = rnorm(nwalk, 0, 0.1)
ensemble[2,] = rnorm(nwalk, 1, 0.1)

# Run for a bit
ens2 = GoodmanWeare(ensemble, lnP, 100, mc.cores=1)

# Plot the resulting ensemble
plot(t(ens2$ensemble))
# Compare to a direct draw from the posterior distribution
points(rnorm(nwalk, 0, pi), rnorm(nwalk, 1, exp(0.5)), col=2, pch=3)



