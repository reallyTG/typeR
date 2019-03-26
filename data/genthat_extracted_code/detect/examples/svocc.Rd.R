library(detect)


### Name: svocc
### Title: ZI Binomial model with single visit
### Aliases: svocc svocc.fit extractMLE svocc.step
### Keywords: htest models

### ** Examples

data(datocc)
## MLE
m00 <- svocc(W ~ x1 | x1 + x3, datocc)
## PMLE
m01 <- svocc(W ~ x1 | x1 + x3, datocc, penalized=TRUE)

## print
m00
## summary
summary(m00)
## coefficients
coef(m00)
## state (occupancy) model estimates
coef(m00, "sta")
## detection model estimates
coef(m00, "det")
## compare estimates
cbind(truth=c(0.6, 0.5, 0.4, -0.5, 0.3),
mle=coef(m00), pmle=coef(m01))

## AIC, BIC
AIC(m00)
BIC(m00)
## log-likelihood
logLik(m00)
## variance-covariance matrix
vcov(m00)
vcov(m00, model="sta")
vcov(m00, model="det")
## confidence intervals
confint(m00)
confint(m00, model="sta")
confint(m00, model="det")

## fitted values
## (conditional probability of occurrence given detection history:
## if W=1, fitted=1,
## if W=0, fitted=(phi*(1-delta)) / ((1-delta) + phi * (1-delta))
summary(fitted(m00))
## estimated probabilities: (phi*(1-delta)) / ((1-delta) + phi * (1-delta))
summary(m00$estimated.probabilities)
## probability of occurrence (phi)
summary(m00$occurrence.probabilities)
## probability of detection (delta)
summary(m00$detection.probabilities)

## Not run: 
##D ## model selection
##D m02 <- svocc(W ~ x1 | x3 + x4, datocc)
##D m03 <- drop1(m02, model="det")
##D ## dropping one term at a time, resulting change in AIC
##D m03
##D ## updating the model
##D m04 <- update(m02, . ~ . | . - x4)
##D m04
##D ## automatic model selection
##D ## part of the model (sta/det) must be specified
##D m05 <- svocc.step(m02, model="det")
##D summary(m05)
##D 
##D ## nonparametric bootstrap
##D m06 <- bootstrap(m01, B=25)
##D attr(m06, "bootstrap")
##D extractBOOT(m06)
##D summary(m06, type="mle")
##D summary(m06, type="pmle") ## no SEs! PMLE!!!
##D summary(m06, type="boot")
##D ## vcov
##D #vcov(m06, type="mle") ## this does not work with PMLE
##D vcov(m06, type="boot") ## this works
##D ## confint
##D confint(m06, type="boot") ## quantile based
##D 
##D ## parametric bootstrap
##D ## sthis is how observations are simulated
##D head(simulate(m01, 5))
##D m07 <- bootstrap(m01, B=25, type="param")
##D extractBOOT(m07)
##D summary(m07)
##D 
##D data(oven)
##D ovenc <- oven
##D ovenc[, c(4:8,10:11)][] <- lapply(ovenc[, c(4:8,10:11)], scale)
##D ovenc$count01 <- ifelse(ovenc$count > 0, 1, 0)
##D moven <- svocc(count01 ~ pforest | julian + timeday, ovenc)
##D summary(moven)
##D drop1(moven, model="det")
##D moven2 <- update(moven, . ~ . | . - timeday)
##D summary(moven)
##D 
##D BIC(moven, moven2)
##D AUC(moven, moven2)
##D rocplot(moven)
##D rocplot(moven2, col=2, add=TRUE)
## End(Not run)



