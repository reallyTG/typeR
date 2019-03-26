library(OpenMx)


### Name: mxFactorScores
### Title: Estimate factor scores and standard errors
### Aliases: mxFactorScores

### ** Examples


# Create and estimate a factor model
require(OpenMx)
data(demoOneFactor)
manifests <- names(demoOneFactor)
latents <- c("G")
factorModel <- mxModel("OneFactor", 
                       type="LISREL",
                       manifestVars=list(exo=manifests), 
                       latentVars=list(exo=latents),
                       mxPath(from=latents, to=manifests),
                       mxPath(from=manifests, arrows=2),
                       mxPath(from=latents, arrows=2, free=FALSE, values=1.0),
                       mxPath(from='one', to=manifests),
                       mxData(observed=cov(demoOneFactor), type="cov", numObs=500,
                              means = colMeans(demoOneFactor)))
summary(factorRun <- mxRun(factorModel))

# Swap in raw data in place of summary data
factorRun <- mxModel(factorRun, mxData(observed=demoOneFactor[1:50,], type="raw"))

# Estimate factor scores for the model
r1 <- mxFactorScores(factorRun, 'Regression')





