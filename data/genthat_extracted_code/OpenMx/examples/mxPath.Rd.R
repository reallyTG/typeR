library(OpenMx)


### Name: mxPath
### Title: Create List of Paths
### Aliases: mxPath MxPath-class print,MxPath-method show,MxPath-method
###   $,MxPath-method $<-,MxPath-method

### ** Examples

# A simple Example: 1 factor Confirmatory Factor Analysis

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
summary(factorFit)

# A more complex example using features of R to compress
#  what would otherwise be a long and error-prone script

# list of 100 variable names: "01"  "02"  "03"...
myManifest <- sprintf("%02d", c(1:100))

# the latent variables for the model
myLatent <- c("G1", "G2", "G3", "G4", "G5")


# Start building the model:
#  Define its type, and add the manifest and latent variable name lists
testModel <- mxModel(model="testModel", type = "RAM",
                     manifestVars = myManifest, latentVars = myLatent)

# Create covariances between the latent variables and add to the model
# Here we use combn to create the covariances
# nb: To create the variances and covariances in one operation you could use
# expand.grid(myLatent,myLatent) to specify from and to

uniquePairs <- combn(myLatent,2)
covariances <- mxPath(from = uniquePairs[1,],
                      to=uniquePairs[2,], arrows = 2, free = TRUE, values = 1)
testModel <- mxModel(model=testModel, covariances) 

# Create variances for the latent variables
variances <- mxPath(from = myLatent,
                    to=myLatent, arrows = 2, free = TRUE, values = 1)
testModel <- mxModel(model=testModel, variances) # add variances to the model

# Make a list of paths from each packet of 20 manifests
#  to one of the 5 latent variables
# nb: The first loading to each latent is fixed to 1 to scale its variance.
singles <- list()
for (i in 1:5) {
    j <- i*20
    singles <- append(singles, mxPath(
                        from = myLatent[i], to = myManifest[(j - 19):j],
                        arrows = 1,
                        free   = c(FALSE, rep(TRUE, 19)), 
                        values = c(1, rep(0.75, 19))))
}

# add single-headed paths to the model
testModel <- mxModel(model=testModel, singles)




