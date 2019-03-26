library(bayesplot)


### Name: MCMC-parcoord
### Title: Parallel coordinates plot of MCMC draws
### Aliases: MCMC-parcoord mcmc_parcoord mcmc_parcoord_data
###   parcoord_style_np

### ** Examples

color_scheme_set("pink")
x <- example_mcmc_draws(params = 5)
mcmc_parcoord(x)
mcmc_parcoord(x, regex_pars = "beta")

## Not run: 
##D # Example using a Stan demo model
##D library(rstan)
##D fit <- stan_demo("eight_schools")
##D draws <- as.array(fit, pars = c("mu", "tau", "theta", "lp__"))
##D np <- nuts_params(fit)
##D str(np)
##D levels(np$Parameter)
##D 
##D color_scheme_set("brightblue")
##D mcmc_parcoord(draws, alpha = 0.05)
##D mcmc_parcoord(draws, np = np)
##D 
##D # customize appearance of divergences
##D color_scheme_set("darkgray")
##D div_style <- parcoord_style_np(div_color = "green", div_size = 0.05, div_alpha = 0.4)
##D mcmc_parcoord(draws, size = 0.25, alpha = 0.1,
##D               np = np, np_style = div_style)
##D 
##D # to use a transformation (e.g., to standarde all the variables)
##D # specify the 'transformations' argument (though partial argument name
##D # matching means we can just use 'trans' or 'transform')
##D mcmc_parcoord(
##D   draws,
##D   transform = function(x) {(x - mean(x)) / sd(x)},
##D   size = 0.25,
##D   alpha = 0.1,
##D   np = np,
##D   np_style = div_style
##D  )
##D 
##D # mcmc_parcoord_data returns just the data in a conventient form for plotting
##D d <- mcmc_parcoord_data(x, np = np)
##D head(d)
##D tail(d)
## End(Not run)




