library(ltbayes)


### Name: posttrace
### Title: Trace the Profile of the Log-Posterior Distribution of the
###   Latent Trait of an Item Response Model
### Aliases: posttrace

### ** Examples

alph <- c(1.27,1.34,1.14,1,0.67)   # discrimination parameters
beta <- c(1.19,0.59,0.15,-0.59,-2) # difficulty parameters
gamm <- c(0.1,0.15,0.15,0.2,0.01)  # lower asymptote parameters

# profile of log-likelihood distribution given a sum score of 3
tmp <- posttrace(fmodel3pl, patterns(5, 2, 3), apar = alph, bpar = beta, cpar = gamm,
	prior = function(z) 1)
with(tmp, plot(zeta, post, type = "l"))

# profile of log-posterior distribution (normal prior) given a sum score of 3
tmp <- posttrace(fmodel3pl, patterns(5, 2, 3), apar = alph, bpar = beta, cpar = gamm)
with(tmp, plot(zeta, post, type = "l"))



