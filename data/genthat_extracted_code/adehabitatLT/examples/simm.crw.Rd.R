library(adehabitatLT)


### Name: simm.crw
### Title: Simulation of a Correlated Random Walk
### Aliases: simm.crw
### Keywords: spatial

### ** Examples


set.seed(876)
u <- simm.crw(1:500, r = 0.99, burst = "r = 0.99")
v <- simm.crw(1:500, r = 0.9, burst = "r = 0.9", h = 2)
w <- simm.crw(1:500, r = 0.6, burst = "r = 0.6", h = 5)
x <- simm.crw(1:500, r = 0, burst = "r = 0 (Uncorrelated random walk)",
              h = 0.1)
z <- c(u, v, w, x)
plot(z, addpoints = FALSE, perani = FALSE)




