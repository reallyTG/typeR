library(bayesplot)


### Name: MCMC-nuts
### Title: Diagnostic plots for the No-U-Turn-Sampler (NUTS)
### Aliases: MCMC-nuts NUTS mcmc_nuts_acceptance mcmc_nuts_divergence
###   mcmc_nuts_stepsize mcmc_nuts_treedepth mcmc_nuts_energy

### ** Examples

## Not run: 
##D library(ggplot2)
##D library(rstanarm)
##D fit <- stan_glm(mpg ~ wt + am, data = mtcars, iter = 1000)
##D np <- nuts_params(fit)
##D lp <- log_posterior(fit)
##D 
##D color_scheme_set("brightblue")
##D mcmc_nuts_acceptance(np, lp)
##D mcmc_nuts_acceptance(np, lp, chain = 2)
##D 
##D mcmc_nuts_divergence(np, lp)
##D mcmc_nuts_stepsize(np, lp)
##D mcmc_nuts_treedepth(np, lp)
##D 
##D color_scheme_set("red")
##D mcmc_nuts_energy(np)
##D mcmc_nuts_energy(np, merge_chains = TRUE, binwidth = .15)
##D mcmc_nuts_energy(np) +
##D  facet_wrap(~ Chain, nrow = 1) +
##D  coord_fixed(ratio = 150) +
##D  ggtitle("NUTS Energy Diagnostic")
## End(Not run)




