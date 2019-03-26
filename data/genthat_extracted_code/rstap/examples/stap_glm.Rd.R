library(rstap)


### Name: stap_glm
### Title: Bayesian generalized spatial-temporal aggregated predictor(STAP)
###   models via Stan
### Aliases: stap_glm stap_lm

### ** Examples


fit_glm <- stap_glm(formula = y ~ sex + sap(Fast_Food),
                   subject_data = homog_subject_data[1:100,], # for speed of example only
                     distance_data = homog_distance_data,
                     family = gaussian(link = 'identity'),
                     subject_ID = 'subj_id',
                     prior = normal(location = 0, scale = 5, autoscale = FALSE),
                     prior_intercept = normal(location = 25, scale = 5, autoscale = FALSE),
                     prior_stap = normal(location = 0, scale = 3, autoscale = FALSE),
                     prior_theta = log_normal(location = 1, scale = 1),
                     prior_aux = cauchy(location = 0,scale = 5),
                     max_distance = max(homog_distance_data$Distance),
                     chains = 1, iter = 300, # for speed of example only
                     refresh = -1, verbose = FALSE) 




