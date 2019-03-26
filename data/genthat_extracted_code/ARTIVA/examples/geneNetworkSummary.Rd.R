library(ARTIVA)


### Name: geneNetworkSummary
### Title: Function to
### Aliases: geneNetworkSummary
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


# Run the ARTIVAsubnet function
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
##D   niter= 2000,
##D   savePictures=FALSE)
##D 
##D # Print a summary of the obtained network 
##D geneNetworkSummary(ARTIVAtest$network, edgesThreshold = 0.3)
##D 
##D # List of target genes to be analyzed independantly with ARTIVA
##D targetGenes = c("TF3", 45, 50)
##D ARTIVAtest2 = ARTIVAnet(targetData = simulatedProfiles[targetGenes,],
##D   parentData = simulatedProfiles[parentGenes,],
##D   targetName = targetGenes,
##D   parentNames = parentGenes,
##D   segMinLength = 2,
##D   edgesThreshold = 0.6, 
##D   niter= 2000,
##D   savePictures=FALSE)
##D 
##D # Print a summary of the obtained network 
##D geneNetworkSummary(ARTIVAtest2, edgesThreshold = 0.3)
##D 
##D # Re-compute a time-varying network from the output of function 
##D # ARTIVAsubnet with new analysis parameters
##D analysis2 = ARTIVAsubnetAnalysis(ARTIVAsubnet=ARTIVAtest,
##D   segMinLength = 3,
##D   edgesThreshold = 0.5,
##D   outputPath="ARTIVAsubnet2",
##D   savePictures=FALSE)
##D 
##D # Print a summary of the network obtained with the 2nd analysis.
##D geneNetworkSummary(analysis2$network, edgesThreshold = 0.3)
## End(Not run)



