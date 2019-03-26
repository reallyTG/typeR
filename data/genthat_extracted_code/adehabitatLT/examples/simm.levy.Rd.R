library(adehabitatLT)


### Name: simm.levy
### Title: Simulates a Levy Walk
### Aliases: simm.levy
### Keywords: spatial

### ** Examples


set.seed(411)
w <- simm.levy(1:500, mu = 1.5, burst = "mu = 1.5")
u <- simm.levy(1:500, mu = 2, burst = "mu = 2")
v <- simm.levy(1:500, mu = 2.5, burst = "mu = 2.5")
x <- simm.levy(1:500, mu = 3, burst = "mu = 3")
par(mfrow=c(2,2))
lapply(list(w,u,v,x), plot, perani=FALSE)




