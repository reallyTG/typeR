library(ltbayes)


### Name: postsamp
### Title: MCMC Simulation from the Posterior Distribution of the Latent
###   Trait of an Item Response Model
### Aliases: postsamp

### ** Examples

# simulating 10000 realizations from the posterior distribution from
# a partial credit model using a non-adaptive Metropolis algorithm
zeta <- postsamp(fmodelpcm, c(0,1,2,1,0), bpar = matrix(0, 5, 2),
   control = list(nbatch = 10000))
plot(zeta$batch, type = "l") # trace plot

# simulating 10000 realizations from the posterior distribution from
# a partial credit model using an adaptive Metropolis algorithm
zeta <- postsamp(fmodelpcm, c(0,1,2,1,0), bpar = matrix(0, 5, 2),
   control = list(iterations = 10000), method = 'adapt')
plot(zeta$trace, type = "l") # trace plot



