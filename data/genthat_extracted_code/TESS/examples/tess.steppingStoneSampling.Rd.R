library(TESS)


### Name: tess.steppingStoneSampling
### Title: tess.steppingStoneSampling: Marginal likelihood estimation via
###   Stepping-Stone-Sampling.
### Aliases: tess.steppingStoneSampling
### Keywords: htest

### ** Examples


data(cettiidae)
times <- as.numeric( branching.times(cettiidae) )

likelihood <- function(params) {
  # We use the parameters as diversification rate and turnover rate.
  # Thus we need to transform first
  b <- params[1] + params[2]
  d <- params[2]
  
  lnl <- tess.likelihood(times,b,d,samplingProbability=1.0,log=TRUE)
  return (lnl)
}

prior_diversification <- function(x) { dexp(x,rate=0.1,log=TRUE) }
prior_turnover <- function(x) { dexp(x,rate=0.1,log=TRUE) }
priors <- c(prior_diversification,prior_turnover)

# Note, the number of iterations, the burnin
# and the number of stepping stones is too small here
# and should be adapted for real analyses
marginalLikelihood <- tess.steppingStoneSampling( likelihood,
						  priors,
						  runif(2,0,1),
						  c(TRUE,TRUE),
						  10,
						  10,
						  K=4)





