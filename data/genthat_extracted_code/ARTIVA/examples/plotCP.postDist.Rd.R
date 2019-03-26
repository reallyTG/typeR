library(ARTIVA)


### Name: plotCP.postDist
### Title: Function to plot the estimated posterior distribution for the
###   changepoints (CPs) number and position
### Aliases: plotCP.postDist
### Keywords: graphics util

### ** Examples

# Load the ARTIVA R package
library(ARTIVA)

# Load the dataset with simulated gene expression profiles
data(simulatedProfiles)

# Name of the target gene to be analyzed with ARTIVA 
targetGene = 1

# Names of the parent genes (typically transcription factors) 
parentGenes = c("TF1", "TF2", "TF3", "TF4", "TF5")

# run ARTIVAsubnet
# Note that the number of iterations in the RJ-MCMC sampling is reduced 
# to 'niter=20000' in this example, but it should be increased (e.g. up to
# 50000) for a better estimation.

## Not run: 
##D ARTIVAtest = ARTIVAsubnet(targetData = simulatedProfiles[targetGene,],
##D   parentData = simulatedProfiles[parentGenes,],
##D   targetName = targetGene,
##D   parentNames = parentGenes,
##D   segMinLength = 2,
##D   edgesThreshold = 0.6, 
##D   niter= 20000,
##D   savePictures=FALSE)
##D 
##D # compute the PC posterior distribution with other parameters
##D outCPpostDist = CP.postDist(ARTIVAtest$Samples$CP, burn_in=500, 
##D 			    segMinLength=3)
##D 
##D # plot the CP posterior distribution
##D plotCP.postDist(outCPpostDist, targetName=paste("Target", targetGene), 
##D 		  estimatedCPpos=outCPpostDist$estimatedCPpos)
##D 
## End(Not run)



