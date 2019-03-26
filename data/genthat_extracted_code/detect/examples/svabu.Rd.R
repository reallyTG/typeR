library(detect)


### Name: svabu
### Title: Single visit N-mixture abundance models
### Aliases: svabu svabu.fit svabu_nb.fit zif is.present predictMCMC
###   svabu.step
### Keywords: htest models

### ** Examples

data(databu)

## fit BZIP and BP models
m00 <- svabu(Y ~ x1 + x5 | x2 + x5, databu[1:200,])

## print method
m00
## summary: CMLE
summary(m00)
## coef
coef(m00)
coef(m00, model="sta") ## state (abundance)
coef(m00, model="det") ## detection
coef(m00, model="zif") ## zero inflation (this is part of the 'true state'!)

## Not run: 
##D ## Diagnostics and model comparison
##D 
##D m01 <- svabu(Y ~ x1 + x5 | x2 + x5, databu[1:200,], zeroinfl=FALSE)
##D ## compare estimates (note, zero inflation is on the logit scale!)
##D cbind(truth=c(2,-0.8,0.5, 1,2,-0.5, plogis(0.3)),
##D "B-ZIP"=coef(m00), "B-P"=c(coef(m01), NA))
##D 
##D ## fitted
##D plot(fitted(m00), fitted(m01))
##D abline(0,1)
##D 
##D ## compare models
##D AIC(m00, m01)
##D BIC(m00, m01)
##D logLik(m00)
##D logLik(m01)
##D ## diagnostic plot
##D plot(m00)
##D plot(m01)
##D 
##D ## Bootstrap
##D 
##D ## non parametric bootstrap
##D ## - initial values are the estimates
##D m02 <- bootstrap(m00, B=25)
##D attr(m02, "bootstrap")
##D extractBOOT(m02)
##D summary(m02)
##D summary(m02, type="cmle")
##D summary(m02, type="boot")
##D ## vcov
##D vcov(m02, type="cmle")
##D vcov(m02, type="boot")
##D vcov(m02, model="sta")
##D vcov(m02, model="det")
##D ## confint
##D confint(m02, type="cmle") ## Wald-type
##D confint(m02, type="boot") ## quantile based
##D ## parametric bootstrap
##D simulate(m00, 5)
##D m03 <- bootstrap(m00, B=5, type="param")
##D extractBOOT(m03)
##D summary(m03)
##D 
##D ## Model selection
##D 
##D m04 <- svabu(Y ~ x1 + x5 | x2 + x5 + x3, databu[1:200,], phi.boot=0)
##D m05 <- drop1(m04, model="det")
##D m05
##D m06 <- svabu.step(m04, model="det")
##D summary(m06)
##D m07 <- update(m04, . ~ . | . - x3)
##D m07
##D 
##D ## Controls
##D 
##D m00$control
##D getOption("detect.optim.control")
##D getOption("detect.optim.method")
##D options("detect.optim.method"="BFGS")
##D m08 <- svabu(Y ~ x1 + x5 | x2 + x5, databu[1:100,])
##D m08$control ## but original optim method is retained during model selection and bootstrap
##D ## fitted models can be used to provide initial values
##D options("detect.optim.method"="Nelder-Mead")
##D m09 <- svabu(Y ~ x1 + x5 | x2 + x5, databu[1:100,], inits=coef(m08))
##D 
##D ## Ovenbirds dataset
##D 
##D data(oven)
##D ovenc <- oven
##D ovenc[, c(4:8,10:11)][] <- lapply(ovenc[, c(4:8,10:11)], scale)
##D moven <- svabu(count ~ pforest | observ + pforest + julian + timeday, ovenc)
##D summary(moven)
##D drop1(moven, model="det")
##D moven2 <- update(moven, . ~ . | . - timeday)
##D summary(moven2)
##D moven3 <- update(moven2, . ~ . | ., zeroinfl=FALSE)
##D summary(moven3)
##D BIC(moven, moven2, moven3)
## End(Not run)



