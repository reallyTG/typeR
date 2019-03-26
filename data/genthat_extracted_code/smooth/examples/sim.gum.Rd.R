library(smooth)


### Name: sim.gum
### Title: Simulate Generalised Exponential Smoothing
### Aliases: sim.gum
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


# Create 120 observations from GUM(1[1]). Generate 100 time series of this kind.
x <- sim.gum(orders=c(1),lags=c(1),obs=120,nsim=100)

# Generate similar thing for seasonal series of GUM(1[1],1[4]])
x <- sim.gum(orders=c(1,1),lags=c(1,4),frequency=4,obs=80,nsim=100,transition=c(1,0,0.9,0.9))

# Estimate model and then generate 10 time series from it
ourModel <- gum(rnorm(100,100,5))
simulate(ourModel,nsim=10)




