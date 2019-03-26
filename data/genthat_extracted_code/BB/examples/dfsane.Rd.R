library(BB)


### Name: dfsane
### Title: Solving Large-Scale Nonlinear System of Equations
### Aliases: dfsane
### Keywords: multivariate

### ** Examples

  trigexp <- function(x) {
# Test function No. 12 in the Appendix of LaCruz and Raydan (2003)
    n <- length(x)
    F <- rep(NA, n)
    F[1] <- 3*x[1]^2 + 2*x[2] - 5 + sin(x[1] - x[2]) * sin(x[1] + x[2])
    tn1 <- 2:(n-1)
    F[tn1] <- -x[tn1-1] * exp(x[tn1-1] - x[tn1]) + x[tn1] * ( 4 + 3*x[tn1]^2) +
        2 * x[tn1 + 1] + sin(x[tn1] - x[tn1 + 1]) * sin(x[tn1] + x[tn1 + 1]) - 8 
    F[n] <- -x[n-1] * exp(x[n-1] - x[n]) + 4*x[n] - 3
    F
    }

    p0 <- rnorm(50)
    dfsane(par=p0, fn=trigexp)  # default is method=2
    dfsane(par=p0, fn=trigexp, method=1)
    dfsane(par=p0, fn=trigexp, method=3)
    dfsane(par=p0, fn=trigexp, control=list(triter=5, M=5))
######################################
 brent <- function(x) {
  n <- length(x)
  tnm1 <- 2:(n-1)
  F <- rep(NA, n)
  F[1] <- 3 * x[1] * (x[2] - 2*x[1]) + (x[2]^2)/4 
  F[tnm1] <-  3 * x[tnm1] * (x[tnm1+1] - 2 * x[tnm1] + x[tnm1-1]) + 
              ((x[tnm1+1] - x[tnm1-1])^2) / 4   
  F[n] <- 3 * x[n] * (20 - 2 * x[n] + x[n-1]) +  ((20 - x[n-1])^2) / 4
  F
  }
  
  p0 <- sort(runif(50, 0, 20))
  dfsane(par=p0, fn=brent, control=list(trace=FALSE))
  dfsane(par=p0, fn=brent, control=list(M=200, trace=FALSE))



