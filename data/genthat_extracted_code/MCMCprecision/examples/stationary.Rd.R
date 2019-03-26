library(MCMCprecision)


### Name: stationary
### Title: Precision of stationary distribution for discrete MCMC variables
### Aliases: stationary

### ** Examples

# data-generating transition matrix
P <- matrix(c(.1,.5,.4,
              0, .5,.5,
              .9,.1,0), ncol = 3, byrow=TRUE)

# input: sequence of sampled models
z <- rmarkov(500, P)
stationary(z)

# input: transition frequencies
N <- transitions(z)
samples <- stationary(N = N, summary = FALSE)

# summaries:
best_models(samples, k = 3)
summary(samples)



