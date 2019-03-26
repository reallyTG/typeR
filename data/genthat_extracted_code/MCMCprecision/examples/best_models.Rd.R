library(MCMCprecision)


### Name: best_models
### Title: Precision for the k Best-Performing Models
### Aliases: best_models

### ** Examples

# a sequence of uncorrelated model indices
mult <- rmultinom(1000, 1, c(.05, .6, .15, .12, .08))
idx <- apply(mult, 2, which.max)
z <- letters[idx]
stat <- stationary(z, summary = FALSE)
best_models(stat, 3)



