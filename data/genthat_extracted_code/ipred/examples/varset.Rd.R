library(ipred)


### Name: varset
### Title: Simulation Model
### Aliases: varset
### Keywords: misc

### ** Examples


theta90 <- varset(N = 1000, sigma = 0.1, theta = 90, threshold = 0)
theta0 <- varset(N = 1000, sigma = 0.1, theta = 0, threshold = 0)
par(mfrow = c(1, 2))
plot(theta0$intermediate)
plot(theta90$intermediate)




