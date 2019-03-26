library(BoomSpikeSlab)


### Name: make.spike.slab.prior
### Title: Create a spike and slab prior for use with lm.spike.
### Aliases: SpikeSlabPrior
### Keywords: models regression

### ** Examples

  x <- cbind(1, matrix(rnorm(900), ncol = 9))
  beta <- rep(0, 10)
  beta[1] <- 3
  beta[5] <- -4
  beta[8] <- 2
  y <- rnorm(100, x %*% beta)
  ## x has 10 columns, including the intercept
  prior <- SpikeSlabPrior(x, y,
             expected.model.size = 3,  # expect 3 nonzero predictors
             prior.df = .01,           # weaker prior than the default
             prior.information.weight = .01,
             diagonal.shrinkage = 0,   # use Zellner's prior
             optional.coefficient.estimate = rep(0, 10) # shrink to zero
          )
  ## now 'prior' can be fed to 'lm.spike'
  model <- lm.spike(y ~ x - 1, niter = 1000, prior = prior)



