library(rstanarm)


### Name: posterior_vs_prior
### Title: Juxtapose prior and posterior
### Aliases: posterior_vs_prior posterior_vs_prior.stanreg

### ** Examples


## Not run: 
##D if (!exists("example_model")) example(example_model)
##D # display non-varying (i.e. not group-level) coefficients
##D posterior_vs_prior(example_model, pars = "beta")
##D 
##D # show group-level (varying) parameters and group by parameter
##D posterior_vs_prior(example_model, pars = "varying",
##D                    group_by_parameter = TRUE, color_by = "vs")
##D 
##D # group by parameter and allow axis scales to vary across facets
##D posterior_vs_prior(example_model, regex_pars = "period",
##D                    group_by_parameter = TRUE, color_by = "none",
##D                    facet_args = list(scales = "free"))
##D 
##D # assign to object and customize with functions from ggplot2
##D (gg <- posterior_vs_prior(example_model, pars = c("beta", "varying"), prob = 0.8))
##D 
##D gg + 
##D  ggplot2::geom_hline(yintercept = 0, size = 0.3, linetype = 3) + 
##D  ggplot2::coord_flip() + 
##D  ggplot2::ggtitle("Comparing the prior and posterior")
##D  
##D # compare very wide and very narrow priors using roaches example
##D # (see help(roaches, "rstanarm") for info on the dataset)
##D roaches$roach100 <- roaches$roach1 / 100
##D wide_prior <- normal(0, 10)
##D narrow_prior <- normal(0, 0.1)
##D fit_pois_wide_prior <- stan_glm(y ~ treatment + roach100 + senior, 
##D                                 offset = log(exposure2), 
##D                                 family = "poisson", data = roaches, 
##D                                 prior = wide_prior)
##D posterior_vs_prior(fit_pois_wide_prior, pars = "beta", prob = 0.5, 
##D                    group_by_parameter = TRUE, color_by = "vs", 
##D                    facet_args = list(scales = "free"))
##D                    
##D fit_pois_narrow_prior <- update(fit_pois_wide_prior, prior = narrow_prior)
##D posterior_vs_prior(fit_pois_narrow_prior, pars = "beta", prob = 0.5, 
##D                    group_by_parameter = TRUE, color_by = "vs", 
##D                    facet_args = list(scales = "free"))
##D                    
##D 
##D # look at cutpoints for ordinal model
##D fit_polr <- stan_polr(tobgp ~ agegp, data = esoph, method = "probit",
##D                       prior = R2(0.2, "mean"), init_r = 0.1)
##D (gg_polr <- posterior_vs_prior(fit_polr, regex_pars = "\\|", color_by = "vs",
##D                                group_by_parameter = TRUE))
##D # flip the x and y axes
##D gg_polr + ggplot2::coord_flip()
## End(Not run)




