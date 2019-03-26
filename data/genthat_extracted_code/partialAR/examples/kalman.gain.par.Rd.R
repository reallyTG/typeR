library(partialAR)


### Name: kalman.gain.par
### Title: Kalman gain matrix of the partially autoregressive model
### Aliases: kalman.gain.par
### Keywords: ts models

### ** Examples

kalman.gain.par(0, 1, 0)  # -> c(1, 0)   (pure AR(1))
kalman.gain.par(0, 0, 1)  # -> c(0, 1)   (pure random walk)
kalman.gain.par(0.5, 1, 1)  # -> c(0.3333, 0.6667)



