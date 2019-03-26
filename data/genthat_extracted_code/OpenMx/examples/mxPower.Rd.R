library(OpenMx)


### Name: mxPowerSearch
### Title: Power curve
### Aliases: mxPowerSearch mxPower

### ** Examples

library(OpenMx)

data(demoOneFactor)
manifests <- names(demoOneFactor)
latents <- c("G")
factorModel <- mxModel("One Factor",
                       type="RAM",
                       manifestVars = manifests,
                       latentVars = latents,
                       mxPath(from=latents, to=manifests, values=0.8),
                       mxPath(from=manifests, arrows=2,values=1),
                       mxPath(from=latents, arrows=2,
                              free=FALSE, values=1.0),
                       mxPath(from="one", to=manifests),
                       mxData(demoOneFactor, type="raw"))
factorModelFit <- mxRun(factorModel)

indModel <- factorModelFit
indModel$A$values['x1','G'] <- 0.3
indModel$A$free['x1','G'] <- FALSE
indModel <- mxRun(indModel)

# What power do we have at different sample sizes
# to detect that the G to x1 factor loading is
# really 0.3 instead of 0.39?
mxPowerSearch(factorModelFit, indModel, method='ncp')

# If we want to conduct a study with 80% power to
# find that  the G to x1 factor loading is
# really 0.3 instead of 0.39, what sample size
# should we use?
mxPower(factorModelFit, indModel, method='ncp')



