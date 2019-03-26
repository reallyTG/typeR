library(OpenMx)


### Name: omxSaturatedModel
### Title: Create Reference (Saturated and Independence) Models
### Aliases: omxSaturatedModel mxRefModels

### ** Examples

require(OpenMx)
data(demoOneFactor)
manifests <- names(demoOneFactor)
latents <- c("G")
factorModel <- mxModel("OneFactor", type = "RAM",
    manifestVars = manifests, latentVars = latents,
    mxPath(from = latents, to=manifests, values = diag(var(demoOneFactor))*.2),
    mxPath(from = manifests, arrows = 2, values = diag(var(demoOneFactor))*.8),
    mxPath(from = latents, arrows = 2, free = FALSE, values = 1),
    mxData(cov(demoOneFactor), type = "cov", numObs = 500)
)
factorRun <- mxRun(factorModel)
factorSat <- mxRefModels(factorRun, run=TRUE)
summary(factorRun)
summary(factorRun, refModels=factorSat)

# A raw-data example where using mxRefModels adds fit indices
## Not run: 
##D m1 <- mxModel("OneFactor", type = "RAM",
##D     manifestVars = manifests, latentVars = latents,
##D     mxPath(latents, to=manifests, values = diag(var(demoOneFactor))*.2),
##D     mxPath(manifests, arrows = 2, values = diag(var(demoOneFactor))*.8),
##D     mxPath(latents, arrows = 2, free = FALSE, values = 1),
##D     mxPath("one", to = latents, free = FALSE, values = 0),
##D     mxPath("one", to = manifests, values = 0),
##D     mxData(demoOneFactor, type = "raw")
##D )
##D m1 <- mxRun(m1)
##D summary(m1) # CFI, TLI, RMSEA missing
##D summary(m1, refModels=mxRefModels(m1, run = TRUE))
## End(Not run)




