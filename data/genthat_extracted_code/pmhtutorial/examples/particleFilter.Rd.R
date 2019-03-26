library(pmhtutorial)


### Name: particleFilter
### Title: Fully-adapted particle filter for state estimate in a linear
###   Gaussian state space model
### Aliases: particleFilter
### Keywords: ts

### ** Examples

# Generates 500 observations from a linear state space model with
# (phi, sigma_e, sigma_v) = (0.5, 1.0, 0.1) and zero initial state.
theta <- c(0.5, 1.0, 0.1)
d <- generateData(theta, noObservations=500, initialState=0.0) 

# Estimate the filtered state using a Particle filter
pfOutput <- particleFilter(d$y, theta, noParticles = 50, 
  initialState=0.0)

# Plot the estimate and the true state
par(mfrow=c(3, 1))
plot(d$x[1:500], type="l", xlab="time", ylab="true state", bty="n", 
  col="#1B9E77")
plot(pfOutput$xHatFiltered, type="l", xlab="time", 
  ylab="paticle filter estimate", bty="n", col="#D95F02")
plot(d$x[1:500]-pfOutput$xHatFiltered, type="l", xlab="time", 
  ylab="difference", bty="n", col="#7570B3")



