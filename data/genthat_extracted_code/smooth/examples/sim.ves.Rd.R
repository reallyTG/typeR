library(smooth)


### Name: sim.ves
### Title: Simulate Vector Exponential Smoothing
### Aliases: sim.ves
### Keywords: models multivariate nonlinear regression ts

### ** Examples


# Create 40 observations of quarterly data using AAA model with errors
# from normal distribution
## Not run: 
##D VESAAA <- sim.ves(model="AAA",frequency=4,obs=40,nSeries=3,
##D                    randomizer="rnorm",mean=0,sd=100)
## End(Not run)

# You can also use mvrnorm function from MASS package as randomizer,
# but you need to provide mu and Sigma explicitly
## Not run: 
##D VESANN <- sim.ves(model="ANN",frequency=4,obs=40,nSeries=2,
##D                    randomizer="mvrnorm",mu=c(100,50),Sigma=matrix(c(40,20,20,30),2,2))
## End(Not run)

# When generating the data with multiplicative model a more diligent definitiion
# of parameters is needed. Here's an example with MMM model:

VESMMM <- sim.ves("AAA", obs=120, nSeries=2, frequency=12, initial=c(10,0),
          initialSeason=runif(12,-1,1), persistence=c(0.06,0.05,0.2), mean=0, sd=0.03)
VESMMM$data <- exp(VESMMM$data)

# Note that smoothing parameters should be low and the standard diviation should
# definitely be less than 0.1. Otherwise you might face the explosions.




