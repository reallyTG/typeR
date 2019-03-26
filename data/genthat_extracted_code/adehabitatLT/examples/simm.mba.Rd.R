library(adehabitatLT)


### Name: simm.mba
### Title: Simulation of an Arithmetic Brownian Motion
### Aliases: simm.mba
### Keywords: spatial

### ** Examples


set.seed(253)
u <- simm.mba(1:1000, sigma = diag(c(4,4)), 
              burst = "Brownian motion")
v <- simm.mba(1:1000, sigma = matrix(c(2,-0.8,-0.8,2), ncol = 2),
              burst = "cov(x,y) > 0")
w <- simm.mba(1:1000, mu = c(0.1,0), burst = "drift > 0")
x <- simm.mba(1:1000, mu = c(0.1,0),
              sigma = matrix(c(2, -0.8, -0.8, 2), ncol=2),
              burst = "Drift and cov(x,y) > 0")
z <- c(u, v, w, x)
plot(z, addpoints = FALSE, perani = FALSE)




