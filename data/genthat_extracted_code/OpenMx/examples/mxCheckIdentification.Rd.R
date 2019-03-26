library(OpenMx)


### Name: mxCheckIdentification
### Title: Check that a model is locally identified
### Aliases: mxCheckIdentification

### ** Examples


require(OpenMx)

data(demoOneFactor)
manifests <- names(demoOneFactor)
latents <- "G1"
model2 <- mxModel(model="One Factor", type="RAM",
      manifestVars = manifests,
      latentVars = latents,
      mxPath(from = latents[1], to=manifests[1:5]),
      mxPath(from = manifests, arrows = 2, lbound=1e-6),
      mxPath(from = latents, arrows = 2, free = FALSE, values = 1.0),
      mxData(cov(demoOneFactor), type = "cov", numObs=500)
)
fit2 <- mxRun(model2)

id2 <- mxCheckIdentification(fit2)
id2$status
# The model is locally identified

# Build a model from the solution of the previous one
#  but now the factor variance is also free
model2n <- mxModel(fit2, name="Non Identified Two Factor",
      mxPath(from=latents[1], arrows=2, free=TRUE, values=1)
)

mid2 <- mxCheckIdentification(model2n)
mid2$non_identified_parameters
# The factor loadings and factor variance
#  are not identified.




