library(OpenMx)


### Name: omxRMSEA
### Title: Get the RMSEA with confidence intervals from model
### Aliases: omxRMSEA

### ** Examples

require(OpenMx)
data(demoOneFactor)
manifests <- names(demoOneFactor)
latents <- c("G")
factorModel <- mxModel("One Factor", 
                       type="RAM",
                       manifestVars=manifests, 
                       latentVars=latents,
                       mxPath(from=latents, to=manifests),
                       mxPath(from=manifests, arrows=2),
                       mxPath(from=latents, arrows=2, free=FALSE, values=1.0),
                       mxData(observed=cov(demoOneFactor), type="cov", numObs=500))
factorRun <- mxRun(factorModel)
factorSat <- mxRefModels(factorRun, run=TRUE)
summary(factorRun, refModels=factorSat)
# Gives RMSEA with 95% confidence interval

omxRMSEA(factorRun, .05, .95, refModels=factorSat)
# Gives RMSEA with 90% confidence interval
#  and probability of 'close enough' fit



