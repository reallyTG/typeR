library(BB)


### Name: spg
### Title: Large-Scale Optimization
### Aliases: spg
### Keywords: multivariate

### ** Examples

sc2.f <- function(x){ sum((1:length(x)) * (exp(x) - x)) / 10}

sc2.g <- function(x){ (1:length(x)) * (exp(x) - 1) / 10}

p0 <- rnorm(50)
ans.spg1 <- spg(par=p0, fn=sc2.f)  # Default is method=3
ans.spg2 <- spg(par=p0, fn=sc2.f, method=1)
ans.spg3 <- spg(par=p0, fn=sc2.f, method=2)
ans.cg <- optim(par=p0, fn=sc2.f, method="CG")  #Uses conjugate-gradient method in "optim"
ans.lbfgs <- optim(par=p0, fn=sc2.f, method="L-BFGS-B")  #Uses low-memory BFGS method in "optim"

# Now we use exact gradient.  
# Computation is much faster compared to when using numerical gradient.
ans.spg1 <- spg(par=p0, fn=sc2.f, gr=sc2.g)

############
# Another example illustrating use of additional parameters to objective function 
valley.f <- function(x, cons) {
  n <- length(x)
  f <- rep(NA, n)
  j <- 3 * (1:(n/3))
  jm2 <- j - 2
  jm1 <- j - 1
  f[jm2] <- (cons[2] * x[jm2]^3 + cons[1] * x[jm2]) * exp(-(x[jm2]^2)/100) - 1
  f[jm1] <- 10 * (sin(x[jm2]) - x[jm1])
  f[j] <- 10 * (cos(x[jm2]) - x[j])
  sum(f*f)
  }

k <- c(1.003344481605351, -3.344481605351171e-03)
p0 <- rnorm(30)  # number of parameters should be a multiple of 3 for this example
ans.spg2 <- spg(par=p0, fn=valley.f, cons=k, method=2)  
ans.cg <- optim(par=p0, fn=valley.f, cons=k, method="CG")  
ans.lbfgs <- optim(par=p0, fn=valley.f, cons=k, method="L-BFGS-B")  

####################################################################
# Here is a statistical example illustrating log-likelihood maximization.

poissmix.loglik <- function(p,y) {
  # Log-likelihood for a binary Poisson mixture
  i <- 0:(length(y)-1)
  loglik <- y*log(p[1]*exp(-p[2])*p[2]^i/exp(lgamma(i+1)) + 
        (1 - p[1])*exp(-p[3])*p[3]^i/exp(lgamma(i+1)))
  return (sum(loglik) )
  }

# Data from Hasselblad (JASA 1969)
poissmix.dat <- data.frame(death=0:9, freq=c(162,267,271,185,111,61,27,8,3,1))
y <- poissmix.dat$freq

# Lower and upper bounds on parameters
lo <- c(0.001,0,0)  
hi <- c(0.999, Inf, Inf)

p0 <- runif(3,c(0.2,1,1),c(0.8,5,8))  # randomly generated starting values

ans.spg <- spg(par=p0, fn=poissmix.loglik, y=y, lower=lo, upper=hi, 
     control=list(maximize=TRUE))

# how to compute hessian at the MLE
  require(numDeriv)
  hess <- hessian(x=ans.spg$par, poissmix.loglik, y=y)
  se <- sqrt(-diag(solve(hess)))  # approximate standard errors





