library(dgo)


### Name: dgirt_fit-class
### Title: A class for fitted dynamic group IRT models
### Aliases: dgirt_fit-class dgirt_fit

### ** Examples

data(toy_dgirtfit)
# summarize the fitted results
summary(toy_dgirtfit, pars = 'xi')

# get posterior means with a convenience function
get_posterior_mean(toy_dgirtfit, pars = 'theta_bar')

# generally apply functions to posterior samples after warmup; n.b.
# `as.array` is iterations x chains x parameters so `MARGIN = 3` applies
# `FUN` over iterations and chains
apply(as.array(toy_dgirtfit, pars = 'xi'), 3, mean)

# access the posterior samples
head(as.data.frame(toy_dgirtfit, pars = 'theta_bar'))



