library(likelihoodAsy)


### Name: rstar
### Title: Inference on a scalar function of interest by the r* statistic
### Aliases: rstar
### Keywords: htest

### ** Examples

# Autoregressive model of order 1
# We use the lh data from MASS
library(MASS)
data(lh)
dat.y <- list(y=as.numeric(lh))
# First let us define the function returning the log likelihood function
# We employ careful parameterizations for the correlation and variance to
# avoid numerical problems
likAR1 <- function(theta, data)
{ 
  y <- data$y
  mu <- theta[1]
  phi <- theta[2] ### phi is log(sigma) 
  sigma2 <- exp(phi*2)
  z <- theta[3]   ### z is Fisher'z transform for rho
  rho <- (exp(2*z)-1) / (1 + exp(2*z))
  n <- length(y)
  Gamma1 <- diag(1+c(0,rep(rho^2,n-2),0))
  for(i in 2:n)
    Gamma1[i,i-1]<- Gamma1[i-1,i] <- -rho 
  lik <- -n/2 * log(sigma2) + 0.5 * log(1-rho^2) -1/(2*sigma2) * 
        mahalanobis(y, rep(mu,n), Gamma1, inverted = TRUE)
  return(lik)
}
# We need a function for simulating a data set
genDataAR1 <- function(theta, data)  
{
  out <- data
  mu <- theta[1]
  sigma <- exp(theta[2])
  z <- theta[3]
  rho <- (exp(2*z)-1) / (1 + exp(2*z))
  n <- length(data$y)
  y <- rep(0,n)
  y[1] <- rnorm(1,mu,s=sigma*sqrt(1/(1-rho^2)))
  for(i in 2:n)
    y[i] <- mu + rho * (y[i-1]-mu) + rnorm(1) * sigma 
  out$y <- y 
  return(out)
}
# For inference on the mean parameter we need a function returning the first component of theta
psifcn.mu <- function(theta) theta[1]
# Now we can call the function
rs.mu <- rstar(dat.y, c(0,0,0), likAR1, fpsi=psifcn.mu, psival=2, datagen=genDataAR1, R=1000, 
               trace=TRUE, psidesc="mean parameter")
summary(rs.mu)



