library(survival)


### Name: anova.coxph
### Title: Analysis of Deviance for a Cox model.
### Aliases: anova.coxph anova.coxphlist
### Keywords: models regression survival

### ** Examples

fit <- coxph(Surv(futime, fustat) ~ resid.ds *rx + ecog.ps, data = ovarian) 
anova(fit)
fit2 <- coxph(Surv(futime, fustat) ~ resid.ds +rx + ecog.ps, data=ovarian)
anova(fit2,fit)
 


