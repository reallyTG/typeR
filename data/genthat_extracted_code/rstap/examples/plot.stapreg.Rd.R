library(rstap)


### Name: plot.stapreg
### Title: Plot method for stapreg objects
### Aliases: plot.stapreg

### ** Examples

## Not run: 
##D # Not run for CRAN check speed
##D fit_glm <- stap_glm(formula = y ~ sex + sap(Fast_Food),
##D                    subject_data = homog_subject_data,
##D                      distance_data = homog_distance_data,
##D                      family = gaussian(link = 'identity'),
##D                      subject_ID = 'subj_id',
##D                      prior = normal(location = 0, scale = 5, autoscale = F),
##D                      prior_intercept = normal(location = 25, scale = 5, autoscale = F),
##D                      prior_stap = normal(location = 0, scale = 3, autoscale = F),
##D                      prior_theta = log_normal(location = 1, scale = 1),
##D                      prior_aux = cauchy(location = 0,scale = 5),
##D                      max_distance = max(homog_distance_data$Distance),
##D                      chains = CHAINS, iter = ITER,
##D                      refresh = -1,verbose = F)
##D 
##D plot(fit_glm, plotfun = 'mcmc_hist', pars = "Fast_Food")
## End(Not run)




