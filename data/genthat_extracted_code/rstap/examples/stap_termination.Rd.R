library(rstap)


### Name: stap_termination
### Title: Spatial-Temporal Exposure Termination-Maximization Estimates
### Aliases: stap_termination stap_termination.stapreg

### ** Examples

## Not run: 
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
##D terminal_points <- stap_termination(fit_glm, prob = .9, exposure_limit = 0.01)
## End(Not run)
## Not run: 
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
##D terminal_vals <- stap_termination(fit_glm, prob = .9, exposure_limit = 0.01)
## End(Not run)




