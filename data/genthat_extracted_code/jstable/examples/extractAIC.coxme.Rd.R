library(jstable)


### Name: extractAIC.coxme
### Title: extractAIC.coxme: Extract AIC from coxme.object
### Aliases: extractAIC.coxme

### ** Examples

 library(coxme)
 fit <- coxme(Surv(time, status) ~ ph.ecog + age + (1|inst), lung)
 extractAIC(fit)



