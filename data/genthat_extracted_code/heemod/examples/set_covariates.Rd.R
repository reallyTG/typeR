library(heemod)


### Name: set_covariates
### Title: Set Covariates of a Survival Distribution
### Aliases: set_covariates set_covariates_

### ** Examples


fs1 <- flexsurv::flexsurvreg(
  survival::Surv(rectime, censrec)~group,
  data=flexsurv::bc,
  dist = "llogis"
)
good_model <- set_covariates(fs1, group = "Good")
cohort <- data.frame(group=c("Good", "Good", "Medium", "Poor"))
mixed_model <- set_covariates(fs1, data = cohort)




