library(dad)


### Name: distl2d
### Title: L^2 distance between probability densities
### Aliases: distl2d dist.l2d.gs dist.l2d.gs.u dist.l2d.kgw dist.l2d.kgw.u
###   dist.l2d.kga dist.l2d.kga.u

### ** Examples

require(MASS)
m1 <- c(0,0)
v1 <- matrix(c(1,0,0,1),ncol = 2) 
m2 <- c(0,1)
v2 <- matrix(c(4,1,1,9),ncol = 2)
x1 <- mvrnorm(n = 3,mu = m1,Sigma = v1)
x2 <- mvrnorm(n = 5, mu = m2, Sigma = v2)
distl2d(x1, x2, method = "gaussiand")
distl2d(x1, x2, method = "kern")
distl2d(x1, x2, method = "kern", varw1 = v1, varw2 = v2)



