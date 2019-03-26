library(survival)


### Name: survConcordance
### Title: Compute a concordance measure.
### Aliases: survConcordance survConcordance.fit
### Keywords: survival

### ** Examples

survConcordance(Surv(time, status) ~age, data=lung)

options(na.action=na.exclude)
fit <- coxph(Surv(time, status) ~ ph.ecog + age + sex, lung)
survConcordance(Surv(time, status) ~predict(fit), lung)
## Not run: 
##D   n=227 (1 observations deleted due to missing values)
##D Concordance= 0.6371102 , Gamma= 0.2759638 
##D concordant discordant  tied risk  tied time 
##D      12544       7117        126         28 
## End(Not run)


