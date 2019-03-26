library(Bhat)


### Name: mymcmc
### Title: Adaptive Multivariate MCMC sampler
### Aliases: mymcmc
### Keywords: iteration methods optimize

### ** Examples

# generate some Poisson counts on the fly
  dose <- c(rep(0,50),rep(1,50),rep(5,50),rep(10,50))
  data <- cbind(dose,rpois(200,20*(1+dose*.5*(1-dose*0.05))))

# neg. log-likelihood of Poisson model with 'linear-quadratic' mean: 
  nlogf <- function (x) { 
  ds <- data[, 1]
  y  <- data[, 2]
  g <- x[1] * (1 + ds * x[2] * (1 - x[3] * ds)) 
  return(sum(g - y * log(g)))
  }

# start MCMC near mle
  x <- list(label=c("a","b","c"), est=c(20, 0.5, 0.05), low=c(0,0,0), upp=c(100,10,.1))
# samples from posterior density (~exp(-nlogf))) with non-informative
# (random uniform) priors for "a", "b" and "c".
out <- mymcmc(x, nlogf, m1=2000, m2=2000, m3=10000, scl1=0.5, scl2=2, skip=10, plot=TRUE)
# start MCMC from some other point: e.g. try x$est <- c(16,.2,.02)



