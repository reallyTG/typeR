library(ggfortify)


### Name: fortify.survfit
### Title: Convert 'survival::survfit' to 'data.frame'
### Aliases: fortify.survfit fortify.survfit.cox

### ** Examples

library(survival)
fortify(survfit(Surv(time, status) ~ sex, data = lung))
fortify(survfit(Surv(time, status) ~ 1, data = lung))
fortify(survfit(coxph(Surv(time, status) ~ sex, data = lung)))
fortify(survfit(coxph(Surv(time, status) ~ 1, data = lung)))



