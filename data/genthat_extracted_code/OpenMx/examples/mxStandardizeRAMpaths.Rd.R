library(OpenMx)


### Name: mxStandardizeRAMpaths
### Title: Standardize RAM models' path coefficients
### Aliases: mxStandardizeRAMpaths mxStandardizeRAMPaths

### ** Examples

library(OpenMx)
data(demoOneFactor)
manifests <- names(demoOneFactor)
latents   <- c("G")
factorModel <- mxModel(model="One Factor", type="RAM",
      manifestVars = manifests,
      latentVars   = latents,
      mxPath(from=latents, to=manifests),
      mxPath(from=manifests, arrows=2, values=0.1),
      mxPath(from=latents, arrows=2,free=FALSE, values=1.0),
      mxData(cov(demoOneFactor), type="cov",numObs=500)
)
factorFit <-mxRun(factorModel)
summary(factorFit)$parameters
mxStandardizeRAMpaths(model=factorFit,SE=FALSE)

## Likelihood ratio test of variable x1's factor loading:
factorModelNull <- omxSetParameters(factorModel,labels="One Factor.A[1,6]",
                    values=0,free=FALSE)
factorFitNull <- mxRun(factorModelNull)
mxCompare(factorFit,factorFitNull)[2,"p"] #<--p-value

## Confidence intervals for all standardized paths:
factorModel2 <- mxModel(model=factorModel,
                        mxMatrix(type="Iden",nrow=nrow(factorModel$A),name="I"),
                        mxAlgebra( vec2diag(diag2vec( solve(I-A)%*%S%*%t(solve(I-A)) )%^%-0.5) ,
                                   name="InvSD"),
                        mxAlgebra( InvSD %*% A %*% solve(InvSD),
                                   name="Az",dimnames=dimnames(factorModel$A)),
                        mxAlgebra( InvSD %*% S %*% InvSD, 
                                   name="Sz",dimnames=dimnames(factorModel$S)),
                        mxCI(c("Az","Sz"))
)
## Not run: 
##D factorFit2 <- mxRun(factorModel2,intervals=TRUE)
##D ## Contains point values and confidence limits for all paths:
##D summary(factorFit2)$CI
## End(Not run)



