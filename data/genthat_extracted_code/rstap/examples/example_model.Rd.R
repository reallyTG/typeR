library(rstap)


### Name: example_model
### Title: Example model
### Aliases: example_model

### ** Examples

 ## following lines make example run faster
distdata <- subset(homog_longitudinal_bef_data[,c("subj_ID","measure_ID","class","dist")],
                   subj_ID<=10)
timedata <- subset(homog_longitudinal_bef_data[,c("subj_ID","measure_ID","class","time")],
                   subj_ID<=10)
timedata$time <- as.numeric(timedata$time)
subjdata <- subset(homog_longitudinal_subject_data,subj_ID<=10)
example_model <- 
  stap_glmer(y_bern ~ centered_income +  sex + centered_age + stap(Coffee_Shop) + (1|subj_ID),
             family = gaussian(),
             subject_data = subjdata,
             distance_data = distdata,
             time_data = timedata,
             subject_ID = 'subj_ID',
             group_ID = 'measure_ID',
             prior_intercept = normal(location = 25, scale = 4, autoscale = FALSE),
             prior = normal(location = 0, scale = 4, autoscale = FALSE),
             prior_stap = normal(location = 0, scale = 4),
             prior_theta = list(Coffee_Shop = list(spatial = log_normal(location = 1,
                                                                             scale = 1),
                                                         temporal = log_normal(location = 1,
                                                                               scale = 1))),
             max_distance = 3, max_time = 50,
             # chains, cores, and iter set to make the example small and fast
             chains = 1, iter = 25, cores = 1)




