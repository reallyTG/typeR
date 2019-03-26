library(rgw)


### Name: GoodmanWeare.rem
### Title: Goodman-Weare Affine-Invariant Sampling
### Aliases: GoodmanWeare.rem
### Keywords: htest

### ** Examples

# In this example, we'll sample from a simple 2D Gaussian.
# (This is the same example as used in GoodmanWeare.)

# Define the log-posterior function
lnP = function(x) sum( dnorm(x, c(0,1), c(pi, exp(0.5)), log=TRUE) )

# Initialize an ensemble of 100 walkers. We'll take 100 steps, saving the ensemble after each.
nwalk = 100
post = array(NA, dim=c(2, nwalk, 101))
post[1,,1] = rnorm(nwalk, 0, 0.1)
post[2,,1] = rnorm(nwalk, 1, 0.1)

# Run
post = GoodmanWeare.rem(post, lnP, mc.cores=1)

# Plot the final ensemble
plot(post[1,,101], post[2,,101])
# Look at the trace of each parameter for one of the walkers.
plot(post[1,1,])
plot(post[2,1,])



