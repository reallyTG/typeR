library(vcrpart)


### Name: tvcm-methods
### Title: Methods for 'tvcm' objects
### Aliases: tvcm-methods coef.tvcm coefficients.tvcm depth.tvcm extract
###   extract.tvcm formula.tvcm fitted.tvcm getCall.tvcm logLik.tvcm
###   model.frame.tvcm neglogLik2.tvcm nobs.tvcm predict.tvcm print.tvcm
###   ranef.tvcm resid.tvcm residuals.tvcm splitpath splitpath.tvcm
###   summary.tvcm weights.tvcm width.tvcm
### Keywords: methods

### ** Examples

## ------------------------------------------------------------------- #
## Dummy example:
##
## Apply various methods on a 'tvcm' object fitted on the 'vcrpart_2'
## data. Cross-validation is omitted to accelerate the computations.
## ------------------------------------------------------------------- #

data(vcrpart_2)

model <- tvcm(y ~ -1 + vc(z1, z2) + vc(z1, z2, by = x1) + x2,
              data = vcrpart_2, family = gaussian(), subset = 1:90,
              control = tvcm_control(cv = FALSE))

coef(model)
extract(model, "selected")
extract(model, "model")
predict(model, newdata = vcrpart_2[91:100,], type = "node")
predict(model, newdata = vcrpart_2[91:100,], type = "response")
splitpath(model, steps = 1)
summary(model, digits = 2)



