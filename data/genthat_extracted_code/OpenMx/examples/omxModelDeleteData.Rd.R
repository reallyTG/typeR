library(OpenMx)


### Name: omxModelDeleteData
### Title: Remove all instances of data from a model
### Aliases: omxModelDeleteData

### ** Examples


library(OpenMx)

data(demoOneFactor)
manifests <- names(demoOneFactor)
latents   <- c("G")
factorModel <- mxModel(model="One Factor", type="RAM",
      manifestVars = manifests,
      latentVars   = latents,
      mxPath(from=latents, to=manifests),
      mxPath(from=manifests, arrows=2),
      mxPath(from=latents, arrows=2,free=FALSE, values=1.0),
      mxData(cov(demoOneFactor), type="cov",numObs=500)
)
factorFit <-mxRun(factorModel)
object.size(factorFit)
factorFit <- omxModelDeleteData(factorFit)
object.size(factorFit)
factorFit$data




