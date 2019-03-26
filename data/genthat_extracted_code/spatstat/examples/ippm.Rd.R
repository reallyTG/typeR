library(spatstat)


### Name: ippm
### Title: Fit Point Process Model Involving Irregular Trend Parameters
### Aliases: ippm
### Keywords: spatial models

### ** Examples

  nd <- 32
  ## Don't show: 
nd <- 10
## End(Don't show)
  
  gamma0 <- 3
  delta0 <- 5
  POW <- 3
  # Terms in intensity
  Z <- function(x,y) { -2*y }
  f <- function(x,y,gamma,delta) { 1 + exp(gamma - delta * x^POW) }
  # True intensity
  lamb <- function(x,y,gamma,delta) { 200 * exp(Z(x,y)) * f(x,y,gamma,delta) }
  # Simulate realisation
  lmax <- max(lamb(0,0,gamma0,delta0), lamb(1,1,gamma0,delta0))
  set.seed(42)
  X <- rpoispp(lamb, lmax=lmax, win=owin(), gamma=gamma0, delta=delta0)
  # Partial derivatives of log f
  DlogfDgamma <- function(x,y, gamma, delta) {
    topbit <- exp(gamma - delta * x^POW)
    topbit/(1 + topbit)
  }
  DlogfDdelta <- function(x,y, gamma, delta) {
    topbit <- exp(gamma - delta * x^POW)
    - (x^POW) * topbit/(1 + topbit)
  }
  # irregular score
  Dlogf <- list(gamma=DlogfDgamma, delta=DlogfDdelta)
  # fit model
  ippm(X ~Z + offset(log(f)),
       covariates=list(Z=Z, f=f),
       iScore=Dlogf,
       start=list(gamma=1, delta=1),
       nlm.args=list(stepmax=1),
       nd=nd)



