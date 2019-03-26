library(anoint)


### Name: obo
### Title: Perform one-by-one (OBO) estimates of treatment-covariate
###   interaction
### Aliases: obo

### ** Examples

data(simsolvd)

obj <- anoint(Surv(ttodthorchfhosp,censor==0)~(age+beat+lvef)*trt,
				data = simsolvd, family = "coxph")

fits <- obo(obj)

fits

lapply(fits$fit, summary)



