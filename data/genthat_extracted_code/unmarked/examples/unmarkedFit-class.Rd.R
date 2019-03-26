library(unmarked)


### Name: unmarkedFit-class
### Title: Class "unmarkedFit"
### Aliases: unmarkedFit unmarkedFit-class getData
###   getData,unmarkedFit-method hessian hessian,unmarkedFit-method
###   hist,unmarkedFitDS-method mle mle,unmarkedFit-method
###   names,unmarkedFit-method nllFun nllFun,unmarkedFit-method
###   parboot,unmarkedFit-method plot,unmarkedFit,missing-method
###   profile,unmarkedFit-method residuals,unmarkedFit-method
###   residuals,unmarkedFitOccu-method residuals,unmarkedFitOccuFP-method
###   residuals,unmarkedFitOccuRN-method update,unmarkedFit-method
###   update,unmarkedFitColExt-method update,unmarkedFitPCO-method
###   update,unmarkedFitGMM-method sampleSize sampleSize,unmarkedFit-method
###   unmarkedFitOccu-class unmarkedFitOccuPEN-class
###   unmarkedFitOccuPEN_CV-class unmarkedFitOccuFP-class
###   unmarkedFitPCount-class unmarkedFitDS-class unmarkedFitMPois-class
###   unmarkedFitPCO-class unmarkedFitGMM-class plot,profile,missing-method
###   show,unmarkedFit-method summary,unmarkedFit-method
###   summary,unmarkedFitDS-method smoothed
###   smoothed,unmarkedFitColExt-method projected
###   projected,unmarkedFitColExt-method logLik logLik,unmarkedFit-method
###   LRT LRT,unmarkedFit,unmarkedFit-method
### Keywords: classes

### ** Examples

showClass("unmarkedFit")

# Format removal data for multinomPois 
data(ovendata)
ovenFrame <- unmarkedFrameMPois(y = ovendata.list$data,
	siteCovs = as.data.frame(scale(ovendata.list$covariates[,-1])), 
	type = "removal")

# Fit a couple of models
(fm1 <- multinomPois(~ 1 ~ ufc + trba, ovenFrame))
summary(fm1)

# Apply a bunch of methods to the fitted model

# Look at the different parameter types
names(fm1)
fm1['state']
fm1['det']

# Coefficients from abundance part of the model
coef(fm1, type='state')

# Variance-covariance matrix
vcov(fm1, type='state')

# Confidence intervals using profiled likelihood
confint(fm1, type='state', method='profile')

# Expected values
fitted(fm1)

# Original data
getData(fm1)

# Detection probabilities
getP(fm1)

# log-likelihood
logLik(fm1)

# Back-transform detection probability to original scale
# backTransform only works on models with no covariates or 
#     in conjunction with linearComb (next example)
backTransform(fm1, type ='det')

# Predicted abundance at specified covariate values
(lc <- linearComb(fm1, c(Int = 1, ufc = 0, trba = 0), type='state'))
backTransform(lc)

# Assess goodness-of-fit
parboot(fm1)
plot(fm1)

# Predict abundance at specified covariate values.
newdat <- data.frame(ufc = 0, trba = seq(-1, 1, length=10))
predict(fm1, type='state', newdata=newdat)

# Number of sites in the sample
sampleSize(fm1)

# Fit a new model without covariates
(fmNull <- update(fm1, formula = ~1 ~1))

# Likelihood ratio test
LRT(fm1, fmNull)





