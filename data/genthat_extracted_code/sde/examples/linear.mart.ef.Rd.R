library(sde)


### Name: linear.mart.ef
### Title: Linear martingale estimating function
### Aliases: linear.mart.ef
### Keywords: ts

### ** Examples

set.seed(123)
d <- expression(-1 * x)
s <- expression(1) 
x0 <- rnorm(1,sd=sqrt(1/2))
sde.sim(X0=x0,drift=d, sigma=s,N=1000,delta=0.1) -> X
 
d <- expression(-theta * x)
  
linear.mart.ef(X, d, s, a1=expression(-x), lower=0, upper=Inf,
  c.mean=expression(x*exp(-theta*0.1)), 
  c.var=expression((1-exp(-2*theta*0.1))/(2*theta)))



