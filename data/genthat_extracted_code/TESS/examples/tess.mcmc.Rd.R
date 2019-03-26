library(TESS)


### Name: tess.mcmc
### Title: tess.mcmc: Markov chain Monte Carlo simulation using a general
###   Metropolis-Hastings algorithm.
### Aliases: tess.mcmc
### Keywords: htest

### ** Examples

# load in a test data set
data(cettiidae)

# convert the phylogeny into the branching times
times <- as.numeric( branching.times(cettiidae) )

# specify a likelihood function that takes in a vector of parameters
likelihood <- function(params) {
  # We use the parameters as diversification rate and turnover rate.
  # Thus we need to transform first
  b <- params[1] + params[2]
  d <- params[2]
  
  lnl <- tess.likelihood(times,b,d,samplingProbability=1.0,log=TRUE)
  return (lnl)
}

# specify a the prior functions
prior.diversification <- function(x) { dexp(x,rate=0.1,log=TRUE) }
prior.turnover <- function(x) { dexp(x,rate=0.1,log=TRUE) }
priors <- c(prior.diversification,prior.turnover)

# Note, the number of iterations and the burnin is too small here
# and should be adapted for real analyses
samples <- tess.mcmc( likelihood,
		      priors,
		      runif(2,0,1),
		      logTransforms=c(TRUE,TRUE),
		      delta=c(0.1,0.1),
		      iterations=100,
		      burnin=20)

# now summarize and visualize the results
#plot(samples)
summary(samples)
colMeans(samples)





