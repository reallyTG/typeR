library(adehabitatLT)


### Name: simm.mou
### Title: Simulation of a Bivariate Ornstein-Uhlenbeck Process
### Aliases: simm.mou
### Keywords: spatial

### ** Examples

set.seed(253)
u <- simm.mou(1:50, burst="Start at the attraction point")
v <- simm.mou(1:50, x0=c(-3,3),
              burst="Start elsewhere")
w <- simm.mou(1:50, a=diag(c(0.5,0.1)), x0=c(-3,3),
              burst="Variable attraction")
x <- simm.mou(1:50, a=diag(c(0.1,0.5)), x0=c(-3,7),
              burst="Both")
z <- c(u,v,w,x)

plot(z, addpoints = FALSE, perani = FALSE)




