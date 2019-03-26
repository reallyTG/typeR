library(BoomSpikeSlab)


### Name: independent.spike.slab.prior
### Title: A spike and slab prior assuming a priori independence.
### Aliases: IndependentSpikeSlabPrior

### ** Examples


  x <- cbind(1, matrix(rnorm(900), ncol = 9))
  beta <- rep(0, 10)
  beta[1] <- 3
  beta[5] <- -4
  beta[8] <- 2
  y <- rnorm(100, x %*% beta)
  ## x has 10 columns, including the intercept
  prior <- IndependentSpikeSlabPrior(x, y,
             expected.model.size = 3,  # expect 3 nonzero predictors
             prior.df = .01,           # weaker prior than the default
             optional.coefficient.estimate = rep(0, 10) # shrink to zero
          )
  ## now 'prior' can be fed to 'lm.spike'
  x <- x[, -1]
  model <- lm.spike(y ~ x, niter = 1000, prior = prior, method = "DA")



