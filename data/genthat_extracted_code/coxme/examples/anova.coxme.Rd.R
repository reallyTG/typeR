library(coxme)


### Name: anova.coxme
### Title: Analysis of Deviance for a Cox model.
### Aliases: anova.coxme anova.coxmelist
### Keywords: models regression survival

### ** Examples

# Testing a shrunken estimate of ECOG performace status
fit1 <- coxph(Surv(time, status) ~ age + sex, data=lung,
               subset=(!is.na(ph.ecog)))
fit2 <- coxme(Surv(time, status) ~ age + sex + (1|ph.ecog), lung)
anova(fit1,fit2)
 


