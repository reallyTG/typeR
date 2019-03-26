library(smooth)


### Name: sim.ces
### Title: Simulate Complex Exponential Smoothing
### Aliases: sim.ces
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


# Create 120 observations from CES(n). Generate 100 time series of this kind.
x <- sim.ces("n",obs=120,nsim=100)

# Generate similar thing for seasonal series of CES(s)_4
x <- sim.ces("s",frequency=4,obs=80,nsim=100)

# Estimate model and then generate 10 time series from it
ourModel <- ces(rnorm(100,100,5))
simulate(ourModel,nsim=10)




