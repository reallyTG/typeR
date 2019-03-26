library(entropart)


### Name: SimTest
### Title: SimTest class
### Aliases: SimTest as.SimTest is.SimTest plot.SimTest summary.SimTest

### ** Examples

# Set the value to test
Real <- 0.8
# Is it a realization of a Gaussian distribution?
Sims <- rnorm(1000)
# Make a Simtest object
st <- as.SimTest(Real, Sims)
plot(st)
summary(st)



