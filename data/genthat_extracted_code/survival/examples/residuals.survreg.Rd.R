library(survival)


### Name: residuals.survreg
### Title: Compute Residuals for 'survreg' Objects
### Aliases: residuals.survreg residuals.survreg.penal
### Keywords: survival

### ** Examples

fit <- survreg(Surv(futime, death) ~ age + sex, mgus2)
summary(fit)   # age and sex are both important

rr  <- residuals(fit, type='matrix')
sum(rr[,1]) - with(mgus2, sum(log(futime[death==1]))) # loglik

plot(mgus2$age, rr[,2], col= (1+mgus2$death)) # ldresp



