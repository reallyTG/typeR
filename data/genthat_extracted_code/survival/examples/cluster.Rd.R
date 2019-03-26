library(survival)


### Name: cluster
### Title: Identify clusters.
### Aliases: cluster
### Keywords: survival

### ** Examples

marginal.model <- coxph(Surv(time, status) ~ rx + cluster(litter), rats,
                         subset=(sex=='f'))
frailty.model  <- coxph(Surv(time, status) ~ rx + frailty(litter), rats,
                         subset=(sex=='f'))



