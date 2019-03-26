library(ARTIVA)


### Name: ARTIVAnet
### Title: Function to run the ARTIVA procedure for Auto Regressive
###   TIme-VArying network inference on several target genes
### Aliases: ARTIVAnet
### Keywords: DBN inference network inference graphical model time series

### ** Examples

library(ARTIVA)

# Load the dataset with simulated gene expression profiles
data(simulatedProfiles)

# List of target genes to be analyzed independantly with ARTIVA 
targetGenes = c(1, 10, 20, "TF3", 45, 50)

# Names of the parent genes (typically transcription factors) 
parentGenes = c("TF1", "TF2", "TF3", "TF4", "TF5")

###
# ARTIVA analysis searching for potential interactions between each target 
# genes and a predefined list of parent genes. 
###

# Note that the number of iterations in the RJ-MCMC sampling is reduced 
# to 'niter=20000' in this example, but it should be increased (e.g. up to
# 50000) for a better estimation.

## Not run: 
##D ARTIVAtest1=ARTIVAnet(targetData = simulatedProfiles[targetGenes,],
##D   parentData = simulatedProfiles[parentGenes,], 
##D   targetNames= targetGenes,
##D   parentNames = parentGenes,
##D   niter = 20000,
##D   savePictures=FALSE)
##D 
##D # Note that function ARTIVAnet calls fonction ARTIVAsubnet for each 
##D # target gene successively and provides a global estimated regulatory 
##D # network entitled "ARTIVA_FinalNetwork.pdf" in addition to the output 
##D # results given by function ARTIVAsubnet.
##D 
##D ## Gene names for the target and the parent genes, minimum segment length, 
##D ## threshold for the edges selection can be specified as follow:
##D ARTIVAtest2=ARTIVAnet(targetData = simulatedProfiles[targetGenes,],
##D   parentData = simulatedProfiles[parentGenes,], 
##D   targetNames= targetGenes,
##D   parentNames = parentGenes,
##D   segMinLength = 2,
##D   edgesThreshold = 0.5, 
##D   niter = 20000,
##D   outputPath = "ARTIVA-test")
## End(Not run)

# By default, the output results (pictures and estimation values) are
# saved in a folder named "ARTIVAnet" created in the current directory
# In order to save the results in a specific folder, for example a
# folder entitled "ARTIVA-test" in the current directory:




