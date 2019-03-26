library(rstap)


### Name: stap_glmer
### Title: Bayesian spatial-temporal generalized linear models with
###   group-specific terms via Stan
### Aliases: stap_glmer stap_lmer

### ** Examples

## Not run: 
##D ## subset to only include id, class name and distance variables
##D distdata <- homog_longitudinal_bef_data[,c("subj_ID","measure_ID","class","dist")]
##D timedata <- homog_longitudinal_bef_data[,c("subj_ID","measure_ID","class","time")]
##D ## distance or time column must be numeric
##D timedata$time <- as.numeric(timedata$time) 
##D fit <- stap_glmer(y_bern ~ centered_income +  sex + centered_age + stap(Coffee_Shop) + (1|subj_ID),
##D                   family = binomial(link='logit'),
##D                   subject_data = homog_longitudinal_subject_data,
##D                   distance_data = distdata,
##D                   time_data = timedata,
##D                   subject_ID = 'subj_ID',
##D                   group_ID = 'measure_ID',
##D                   prior_intercept = normal(location = 25, scale = 4, autoscale = F),
##D                   prior = normal(location = 0, scale = 4, autoscale=F),
##D                   prior_stap = normal(location = 0, scale = 4),
##D                   prior_theta = list(Coffee_Shop = list(spatial = log_normal(location = 1,
##D                                                                              scale = 1),
##D                                                          temporal = log_normal(location = 1,
##D                                                                                scale = 1))),
##D                   max_distance = 3, max_time = 50,
##D                   chains = 4, refresh = -1, verbose = FALSE, 
##D                   iter = 1E3, cores = 1)
## End(Not run)



