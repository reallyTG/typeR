library(calibrator)


### Name: MH
### Title: Very basic implementation of the Metropolis-Hastings algorithm
### Aliases: MH
### Keywords: array

### ** Examples

# First, a bivariate Gaussian:
A <- diag(3) + 0.7
quad.form <- function(M,x){drop(crossprod(crossprod(M,x),x))}
pi.gaussian <- function(x){exp(-quad.form(A/2,x))}
x.gauss <- MH(n=1000, start=c(0,0,0),sigma=diag(3),pi=pi.gaussian)
cov(x.gauss)/solve(A) # Should be a matrix of 1s.


# Now something a bit weirder:
pi.triangle <- function(x){
  1*as.numeric( (abs(x[1])<1.0) & (abs(x[2])<1.0) ) +
  5*as.numeric( (abs(x[1])<0.5) & (abs(x[2])<0.5) ) *
    as.numeric(x[1]>x[2])
}
x.tri <- MH(n=100,start=c(0,0),sigma=diag(2),pi=pi.triangle)
plot(x.tri,main="Try with a higher n")


# Now a Gaussian mixture model:
pi.2gauss <- function(x){
  exp(-quad.form(A/2,x)) +
  exp(-quad.form(A/2,x+c(2,2,2)))
}
x.2 <- MH(n=100,start=c(0,0,0),sigma=diag(3),pi=pi.2gauss)
## Not run: p3d(x.2, theta=44,d=1e4,d0=1,main="Try with more points")





