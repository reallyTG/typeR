library(ARTIVA)


### Name: ARTIVAsubnetAnalysis
### Title: Function to estimate a regulatory time-varying network from the
###   output of function ARTIVAsubnet.
### Aliases: ARTIVAsubnetAnalysis
### Keywords: DBN inference network inference graphical model time series

### ** Examples

# Load the ARTIVA R package
library(ARTIVA)

# Load the dataset with simulated gene expression profiles
data(simulatedProfiles)

# Name of the target gene to be analyzed with ARTIVA 
targetGene = 1

# Names of the parent genes (typically transcription factors) 
parentGenes = c("TF1", "TF2", "TF3", "TF4", "TF5")


# Note that the number of iterations in the RJ-MCMC sampling is reduced 
# to 'niter=20000' in this example, but it should be increased (e.g. up to
# 50000) for a better estimation.

# Run the ARTIVAsubnet function
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
##D # Re-compute a time-varying network from the output of function 
##D # ARTIVAsubnet with new analysis parameters
##D analysis2 = ARTIVAsubnetAnalysis(ARTIVAsubnet=ARTIVAtest,
##D   segMinLength = 3,
##D   edgesThreshold = 0.5,
##D   outputPath="ARTIVAsubnet2",
##D   savePictures=FALSE)
##D 
##D # Trace the obtained network.
##D traceNetworks(analysis2$network, edgesThreshold = 0.3)
## End(Not run)



