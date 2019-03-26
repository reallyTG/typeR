library(ltbayes)


### Name: profileci
### Title: Profile Likelihood Confidence Interval of the Latent Trait of an
###   Item Response Model
### Aliases: profileci

### ** Examples

alph <- c(1.27,1.34,1.14,1,0.67)   # discrimination parameters
beta <- c(1.19,0.59,0.15,-0.59,-2) # difficulty parameters
gamm <- c(0.1,0.15,0.15,0.2,0.01)  # lower asymptote parameters

# profile confidence interval given a sum score of 3
profileci(fmodel3pl, patterns(5, 2, 3), apar = alph, bpar = beta, cpar = gamm)



