library(bayesplot)


### Name: theme_default
### Title: Default bayesplot plotting theme
### Aliases: theme_default

### ** Examples

class(theme_default())

bayesplot_theme_set() # defaults to setting theme_default()
x <- example_mcmc_draws()
mcmc_hist(x)

# change the default font size and family for bayesplots
bayesplot_theme_set(theme_default(base_size = 8, base_family = "sans"))
mcmc_hist(x)
mcmc_areas(x, regex_pars = "beta")

# change back
bayesplot_theme_set()
mcmc_areas(x, regex_pars = "beta")




