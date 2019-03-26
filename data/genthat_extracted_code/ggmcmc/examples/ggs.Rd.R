library(ggmcmc)


### Name: ggs
### Title: Import MCMC samples into a ggs object than can be used by all
###   ggs_* graphical functions.
### Aliases: ggs

### ** Examples

# Assign 'D' to be a data frame suitable for \code{ggmcmc} functions from
# a coda object called S
data(linear)
S <- ggs(s)        # s is a coda object

# Get samples from 'beta' parameters only
S <- ggs(s, family = "beta")



