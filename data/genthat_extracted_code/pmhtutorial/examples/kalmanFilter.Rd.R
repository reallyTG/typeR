library(pmhtutorial)


### Name: kalmanFilter
### Title: Kalman filter for state estimate in a linear Gaussian state
###   space model
### Aliases: kalmanFilter
### Keywords: ts

### ** Examples

# Generates 500 observations from a linear state space model with
# (phi, sigma_e, sigma_v) = (0.5, 1.0, 0.1) and zero initial state.
theta <- c(0.5, 1.0, 0.1)
d <- generateData(theta, noObservations=500, initialState=0.0) 

# Estimate the filtered state using Kalman filter
kfOutput <- kalmanFilter(d$y, theta, 
                         initialState=0.0, initialStateCovariance=0.01)

# Plot the estimate and the true state
par(mfrow=c(3, 1))
plot(d$x, type="l", xlab="time", ylab="true state", bty="n", 
  col="#1B9E77")
plot(kfOutput$xHatFiltered, type="l", xlab="time", 
  ylab="Kalman filter estimate", bty="n", col="#D95F02")
plot(d$x-kfOutput$xHatFiltered, type="l", xlab="time", 
  ylab="difference", bty="n", col="#7570B3")



