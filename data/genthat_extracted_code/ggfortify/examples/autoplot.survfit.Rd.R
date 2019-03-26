library(ggfortify)


### Name: autoplot.survfit
### Title: Autoplot 'survival::survfit'
### Aliases: autoplot.survfit autoplot.survfit.cox

### ** Examples

library(survival)
autoplot(survfit(Surv(time, status) ~ sex, data = lung))
autoplot(survfit(Surv(time, status) ~ sex, data = lung), facets = TRUE)
autoplot(survfit(Surv(time, status) ~ 1, data = lung))
autoplot(survfit(Surv(time, status) ~ sex, data=lung), conf.int = FALSE, censor = FALSE)
autoplot(survfit(coxph(Surv(time, status) ~ sex, data = lung)))



