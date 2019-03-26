library(Libra)


### Name: ggm
### Title: Linearized Bregman solver for composite conditionally likelihood
###   of Gaussian Graphical model with lasso penalty.
### Aliases: ggm
### Keywords: regression

### ** Examples


library(MASS)
p = 20
Omega = diag(1,p,p)
Omega[0:(p-2)*(p+1)+2] = 1/3
Omega[1:(p-1)*(p+1)] = 1/3
S = solve(Omega)
X = mvrnorm(n=500,rep(0,p),S)
obj = ggm(X,10,trate=10)
obj$path[,,50]



