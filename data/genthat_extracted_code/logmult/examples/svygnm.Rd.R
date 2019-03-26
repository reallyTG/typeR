library(logmult)


### Name: svygnm
### Title: Fitting Generalized Nonlinear Models With Complex Survey Data
### Aliases: svygnm svygnm.svyrep.design
### Keywords: models nonlinear

### ** Examples

  library(survey)
  data(api)
  dstrat<-svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
  rstrat<-as.svrepdesign(dstrat)
  glm.mod <- svyglm(api00~ell+meals+mobility, design=rstrat)
  gnm.mod <- svygnm(api00~ell+meals+mobility, design=rstrat, ncpus=1)
  # Both functions give the same result for GLMs
  summary(glm.mod)
  summary(gnm.mod)
  ## Don't show: 
  stopifnot(all.equal(c(coef(glm.mod)), c(coef(gnm.mod))))
  stopifnot(all.equal(c(vcov(glm.mod)), c(vcov(gnm.mod))))
  stopifnot(all.equal(model.matrix(glm.mod), model.matrix(gnm.mod)))
  stopifnot(all.equal(residuals(glm.mod), residuals(gnm.mod)))
  stopifnot(all.equal(summary(glm.mod)$coefficients, summary(gnm.mod)$coefficients))
  
## End(Don't show)

  # GNM, can only be fitted with svygnm()
  summary(svygnm(api00~ell+meals+mobility, design=rstrat, family=poisson, ncpus=1))



