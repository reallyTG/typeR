library(bayesplot)


### Name: MCMC-distributions
### Title: Histograms and kernel density plots of MCMC draws
### Aliases: MCMC-distributions mcmc_hist mcmc_dens mcmc_hist_by_chain
###   mcmc_dens_overlay mcmc_dens_chains mcmc_dens_chains_data mcmc_violin

### ** Examples

set.seed(9262017)
# some parameter draws to use for demonstration
x <- example_mcmc_draws()
dim(x)
dimnames(x)

##################
### Histograms ###
##################

# histograms of all parameters
color_scheme_set("brightblue")
mcmc_hist(x)

# histograms of some parameters
color_scheme_set("pink")
mcmc_hist(x, pars = c("alpha", "beta[2]"))
## No test: 
mcmc_hist(x, pars = "sigma", regex_pars = "beta")
## End(No test)
# example of using 'transformations' argument to plot log(sigma),
# and parsing facet labels (e.g. to get greek letters for parameters)
mcmc_hist(x, transformations = list(sigma = "log"),
          facet_args = list(labeller = ggplot2::label_parsed)) +
          facet_text(size = 15)
## No test: 
# instead of list(sigma = "log"), you could specify the transformation as
# list(sigma = log) or list(sigma = function(x) log(x)), but then the
# label for the transformed sigma is 't(sigma)' instead of 'log(sigma)'
mcmc_hist(x, transformations = list(sigma = log))

# separate histograms by chain
color_scheme_set("pink")
mcmc_hist_by_chain(x, regex_pars = "beta")
## End(No test)

#################
### Densities ###
#################

mcmc_dens(x, pars = c("sigma", "beta[2]"),
          facet_args = list(nrow = 2))
## No test: 
# separate and overlay chains
color_scheme_set("mix-teal-pink")
mcmc_dens_overlay(x, pars = c("sigma", "beta[2]"),
                  facet_args = list(nrow = 2)) +
                  facet_text(size = 14)
x2 <- example_mcmc_draws(params = 6)
mcmc_dens_chains(x2, pars = c("beta[1]", "beta[2]", "beta[3]"))
## End(No test)
# separate chains as violin plots
color_scheme_set("green")
mcmc_violin(x) + panel_bg(color = "gray20", size = 2, fill = "gray30")




