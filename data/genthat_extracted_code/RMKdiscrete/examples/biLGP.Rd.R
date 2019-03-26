library(RMKdiscrete)


### Name: biLGP
### Title: The bivariate Lagrangian Poisson (LGP) distribution
### Aliases: biLGP dbiLGP biLGP.logMV rbiLGP

### ** Examples

## The following two lines do the same thing:
dbiLGP(y=1,theta=1,lambda=0.1)
dbiLGP(y=c(1,1),theta=c(1,1,1),lambda=c(0.1,0.1,0.1))

dbiLGP(y=c(1,1,2,2,3,5),theta=c(1,1,1,2,2,2),lambda=0.1)
## Due to argument cycling, the above line is doing the following three steps:
dbiLGP(y=c(1,1),theta=c(1,1,1),lambda=c(0.1,0.1,0.1))
dbiLGP(y=c(2,2),theta=c(2,2,2),lambda=c(0.1,0.1,0.1))
dbiLGP(y=c(3,5),theta=c(1,1,1),lambda=c(0.1,0.1,0.1))

## Inputs to dbiLGP() can be matrices, too:
dbiLGP(y=matrix(c(1,1,2,2,3,5),ncol=2,byrow=TRUE),
  theta=matrix(c(1,1,1,2,2,2,1,1,1),ncol=3,byrow=TRUE),
  lambda=0.1)

## theta0 = 0 implies independence:
a <- dbiLGP(y=c(1,3),theta=c(0,1,2),lambda=c(0.1,-0.1,0.5))
b <- dLGP(x=1,theta=1,lambda=-0.1) * dLGP(x=3,theta=2,lambda=0.5)
a-b #<--near zero.
## lambdas of zero yield the ordinary Poisson:
a <- dbiLGP(y=c(1,3), theta=c(0,1,2),lambda=0)
b <- dpois(x=1,lambda=1) * dpois(x=3,lambda=2) #<--LGP theta is pois lambda
a-b #<--near zero

( y <- rbiLGP(10,theta=c(1.1,0.87,5.5),lambda=c(0.87,0.89,0.90)) )
dbiLGP(y=y,theta=c(1.1,0.87,5.5),lambda=c(0.87,0.89,0.90))

biLGP.logMV(theta=c(0.65,0.35,0.35),lambda=0.7,tol=1e-8)



