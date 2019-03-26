library(dad)


### Name: l2d
### Title: L^2 inner product of probability densities
### Aliases: l2d l2d.gs l2d.gs.u l2d.kgw l2d.kgw.u l2d.kga l2d.kga.u

### ** Examples

require(MASS)
m1 <- c(0,0)
v1 <- matrix(c(1,0,0,1),ncol = 2) 
m2 <- c(0,1)
v2 <- matrix(c(4,1,1,9),ncol = 2)
x1 <- mvrnorm(n = 3,mu = m1,Sigma = v1)
x2 <- mvrnorm(n = 5, mu = m2, Sigma = v2)
l2d(x1, x2, method = "gaussiand")
l2d(x1, x2, method = "kern")
l2d(x1, x2, method = "kern", varw1 = v1, varw2 = v2)



