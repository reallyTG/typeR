library(MCMCprecision)


### Name: stationary_mle
### Title: MLE for stationary distribution of discrete MCMC variables
### Aliases: stationary_mle

### ** Examples

P <- matrix(c(.1,.5,.4,
              0,.5,.5,
              .9,.1,0), ncol = 3, byrow=TRUE)
z <- rmarkov(1000, P)
stationary_mle(z)

# input: transition frequency
tab <- transitions(z)
stationary_mle(N = tab)



