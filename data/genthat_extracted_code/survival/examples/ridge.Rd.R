library(survival)


### Name: ridge
### Title: Ridge regression
### Aliases: ridge
### Keywords: survival

### ** Examples


coxph(Surv(futime, fustat) ~ rx + ridge(age, ecog.ps, theta=1),
	      ovarian)

lfit0 <- survreg(Surv(time, status) ~1, cancer)
lfit1 <- survreg(Surv(time, status) ~ age + ridge(ph.ecog, theta=5), cancer)
lfit2 <- survreg(Surv(time, status) ~ sex + ridge(age, ph.ecog, theta=1), cancer)
lfit3 <- survreg(Surv(time, status) ~ sex + age + ph.ecog, cancer)




