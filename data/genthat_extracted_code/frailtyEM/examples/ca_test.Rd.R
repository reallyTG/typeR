library(frailtyEM)


### Name: ca_test
### Title: Commenges-Andersen test for heterogeneity
### Aliases: ca_test

### ** Examples

mcox1 <- coxph(Surv(time, status) ~ rx + sex + cluster(litter),
rats, model = TRUE, x = TRUE)
ca_test(mcox1)

mcox2 <- coxph(Surv(time, status) ~ 1, rats, x = TRUE)
ca_test(mcox2, rats$litter)



