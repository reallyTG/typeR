library(anoint)


### Name: uim
### Title: Perform unrestricted multiple treatment-covariate interaction
###   regression
### Aliases: uim

### ** Examples

data(simsolvd)

obj <- anoint(Surv(ttodthorchfhosp,censor==0)~(age+beat+lvef)*trt,
				data = simsolvd, family = "coxph")

fit <- uim(obj)

fit 

summary(fit$fit)



