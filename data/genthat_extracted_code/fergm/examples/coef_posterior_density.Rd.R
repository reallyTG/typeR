library(fergm)


### Name: coef_posterior_density
### Title: Plots the posterior density for FERGM model terms.
### Aliases: coef_posterior_density
### Keywords: FERGM interpret summary

### ** Examples

# load example data
data("ergm.fit")
data("fergm.fit")
data("mesa")

# rstan functions
# Histogram of the posterior
rstan::stan_hist(fergm.fit$stan.fit, par = "beta")
# Density of the posteriors
rstan::stan_dens(fergm.fit$stan.fit, par = "beta")

# We have a cleaner function to look at the posterior densities
densities <- coef_posterior_density(fergm.fit = fergm.fit,
custom_var_names = c("Edges", "Sex Homophily", "Grade Homophily", "Race Homophily",
"GWESP", "Alternating K-Stars"))
densities[[1]]
densities[[2]]



