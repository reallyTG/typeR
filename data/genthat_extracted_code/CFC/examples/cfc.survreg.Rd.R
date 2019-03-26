library(CFC)


### Name: cfc.survreg
### Title: Cause-specific competing-risk survival analysis, using
###   parametric survival regression models
### Aliases: cfc.survreg

### ** Examples

data(bmt)
formul <- Surv(time, cause) ~ platelet + age + tcell
ret <- cfc.survreg(formul, bmt[1:300, ], bmt[-(1:300), ]
  , Nmax = 300, rel.tol = 1e-3)



