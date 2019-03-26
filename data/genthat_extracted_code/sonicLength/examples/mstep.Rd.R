library(sonicLength)


### Name: mstep
### Title: M-step to maximize theta
### Aliases: mstep
### Keywords: optimize

### ** Examples


mat <- diag(10)
mat[ ,10 ] <- 1.0
phi1 <- prop.table( rep(1,10))
theta1 <- 1:10
sonicLength:::mstep( mat, theta1,phi1)



