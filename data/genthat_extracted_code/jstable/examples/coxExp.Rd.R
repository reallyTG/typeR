library(jstable)


### Name: coxExp
### Title: coxExp: transform the unit of coefficients in cox model(internal
###   function)
### Aliases: coxExp

### ** Examples

 library(coxme)
 fit <- coxme(Surv(time, status) ~ ph.ecog + age + (1|inst), lung)
 jstable:::coxExp(jstable:::coxmeTable(fit))



