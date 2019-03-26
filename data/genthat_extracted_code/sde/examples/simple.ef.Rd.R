library(sde)


### Name: simple.ef
### Title: Simple estimating functions of types I and II
### Aliases: simple.ef
### Keywords: ts

### ** Examples

set.seed(123); 
# Kessler's estimator for O-H process
K.est <- function(x) {
  n.obs <- length(x)
  n.obs/(2*(sum(x^2)))
}

# Least squares estimators for the O-H process
LS.est <- function(x) {
  n <- length(x) -1
  k.sum <- sum(x[1:n]*x[2:(n+1)])
  dt <- deltat(x)
  ifelse(k.sum>0, -log(k.sum/sum(x[1:n]^2))/dt, NA)
}

d <- expression(-1 * x)
s <- expression(1) 
x0 <- rnorm(1,sd=sqrt(1/2))
sde.sim(X0=x0,drift=d, sigma=s,N=2500,delta=0.1) -> X
 
# Kessler's estimator as estimating function
f <- list(expression(2*theta*x^2-1))
simple.ef(X, f, lower=0, upper=Inf)
K.est(X)

# Least Squares estimator as estimating function
f <- list(expression(x*(y-x*exp(-0.1*theta))))
simple.ef(X, f, lower=0, upper=Inf)
LS.est(X)



