library(MCMCprecision)


### Name: summary.stationary
### Title: Summary for Posterior Model Probabilities
### Aliases: summary.stationary

### ** Examples

P <- matrix(c(.1,.5,.4,
              0, .5,.5,
              .9,.1,0), ncol = 3, byrow=TRUE)
z <- rmarkov(1000, P)
samples <- stationary(z, summary = FALSE)
summary(samples)




