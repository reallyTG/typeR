library(SamplerCompare)


### Name: simulation.result
### Title: Summarize one MCMC chain
### Aliases: simulation.result

### ** Examples
## Not run: 
##D # An example generated with the following JAGS model:
##D #
##D # model {
##D #   mu[1] <- 0
##D #   mu[2] <- 0
##D #   Sigma[1,1] <- 1
##D #   Sigma[2,2] <- 1
##D #   Sigma[1,2] <- 0.7
##D #   Sigma[2,1] <- 0.7
##D #   x ~ dmnorm(mu, inverse(Sigma))
##D # }
##D #
##D # and the following JAGS script:
##D #
##D # model in "mv.7.model"
##D # compile, nchains(1)
##D # initialize
##D # update 1000
##D # monitor x
##D # update 10000
##D # coda *
##D 
##D # Load data written by JAGS
##D 
##D library(coda)
##D X <- read.coda('CODAchain1.txt', 'CODAindex.txt')
##D 
##D # Dummy distribution object.
##D 
##D N2.dist <- make.dist(2, '2D Normal, cor=0.7', mean=c(0,0))
##D 
##D # Compute simulation result.  evals and tuning are hacks; they
##D # are undefined with Gibbs sampling.  JAGS can do its own burn-in,
##D # so set burn.in to zero.
##D 
##D sim.result <- simulation.result(N2.dist, 'JAGS', X,
##D                                 evals=nrow(X)*ncol(X), tuning=1,
##D                                 burn.in=0)
## End(Not run)


