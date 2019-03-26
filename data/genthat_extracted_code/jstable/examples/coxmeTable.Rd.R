library(jstable)


### Name: coxmeTable
### Title: coxmeTable: Summary table of coxme.object(internal function)
### Aliases: coxmeTable

### ** Examples

 library(coxme)
 fit <- coxme(Surv(time, status) ~ ph.ecog + age + (1|inst), lung)
 jstable:::coxmeTable(fit)



