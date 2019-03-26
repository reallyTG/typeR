library(survidm)


### Name: KM
### Title: Kaplan-Meier product-limit estimate of survival
### Aliases: KM

### ** Examples

require(survival)
obj <- with(colonIDM, survIDM(time1, event1, Stime, event))
KM(time = obj$Stime, status = obj$event, t = 1095)

fit <- survfit(Surv(obj$Stime, obj$event) ~ 1, data = obj)
summary(fit, time = 1095)$surv




