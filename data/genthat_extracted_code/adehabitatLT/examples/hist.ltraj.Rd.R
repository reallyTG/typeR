library(adehabitatLT)


### Name: hist.ltraj
### Title: Histogram of the Descriptive Parameters of a Trajectory
### Aliases: hist.ltraj
### Keywords: hplot

### ** Examples


## Simulation of a Brownian Motion
a <- simm.brown(c(1:300, seq(301,6000,by=20)))
plot(a, addpoints = FALSE)


## dx/sqrt(dt) and dy/sqrt(dt) are normally distributed (see
## ?qqchi) 
hist(a, "dx/sqrt(dt)", freq = FALSE)
lines(tutu <- seq(-5,5, length=50), dnorm(tutu), col="red")

hist(a, "dy/sqrt(dt)", freq = FALSE)
lines(tutu, dnorm(tutu), col="red")


## Look at the distribution of distances between
## successive relocations
hist(a, "dist/sqrt(dt)", freq = FALSE)
lines(tutu <- seq(0,5, length=50), dchi(tutu), col="red")



