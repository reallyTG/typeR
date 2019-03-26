library(survutils)


### Name: get_cox_summary
### Title: Summarizes the Cox Regression Analysis
### Aliases: get_cox_summary

### ** Examples

cox.res <- survival::coxph(survival::Surv(time,status) ~ rx, survival::colon)
get_cox_summary(cox.res)



