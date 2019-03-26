library(deamer)


### Name: deamerKE
### Title: Density estimation with known error density
### Aliases: deamerKE

### ** Examples


#########################################################
#EXAMPLE 1: known error, Laplacian

set.seed(12345)
n=1000
rff=function(x){
  u=rbinom(x, 1, 0.5)
  X=u*rnorm(x, -2, 1)+(1-u)*rnorm(x,2,1)
  return(X)
}
x <- rff(n) #a mixed gaussian distribution

# true density function:
f.true=function(x) (0.5/(sqrt(2*pi)))*(exp(-0.5*(x+2)^2) + exp(-0.5*(x-2)^2))

e <- rlaplace(n, 0, 0.5)
y <- x + e

est <- deamerKE(y, noise.type="laplace", sigma=0.5)
est

curve(f.true(x), -6, 6, lwd=2, lty=3)
lines(est, lwd=2)
lines(density(y), lwd=2, lty=4)
legend("topleft", bty="n", lty=c(1,3,4), lwd=2, legend=c("deamerKE", "true density", 
       "kernel density\nof noisy obs."))

#########################################################
#EXAMPLE 2: known error, Laplacian and non-centered 

set.seed(12345)
n=1000
rff=function(x){
  u=rbinom(x, 1, 0.5)
  X=u*rnorm(x, -2, 1)+(1-u)*rnorm(x,2,1)
  return(X)
}
x <- rff(n) #a mixed gaussian distribution

# true density function:
f.true=function(x) (0.5/(sqrt(2*pi)))*(exp(-0.5*(x+2)^2) + exp(-0.5*(x-2)^2))

e <- rlaplace(n, 2, 0.5) #mean=2 and not zero!
y <- x + e

est <- deamerKE(y, noise.type="laplace", mu=2, from=-4, to=4, sigma=0.5)
est

curve(f.true(x), -6, 6, lwd=2, lty=3)
lines(est, lwd=2)
lines(density(y), lwd=2, lty=4)
legend("topleft", bty="n", lty=c(1,3,4), lwd=2, legend=c("deamerKE", "true density", 
       "kernel density\nof noisy obs."))





