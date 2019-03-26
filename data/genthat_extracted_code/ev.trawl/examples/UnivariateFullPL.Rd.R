library(ev.trawl)


### Name: UnivariateFullPL
### Title: Computes univariate latent trawl FULL pairwise likelihood
###   depending with exponential trawl function with the option to fix some
###   parameter values.
### Aliases: UnivariateFullPL

### ** Examples

times <- c(1,2,3,4,5)
values <- c(2,0,3,4,0)
delta <- 2
fixed_names <- c("alpha", "beta")
fixed_params <- c(2.0, 3.4)
params <- c(0.1, 4.3)
model_vars_names <- c("alpha", "beta", "rho", "kappa")
UnivariateFullPL(times, values, delta, fixed_names, fixed_params,
params, model_vars_names, TRUE, FALSE)




