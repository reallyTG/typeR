library(ARTIVA)


### Name: ARTIVAsubnet
### Title: Function to recover Auto Regressive TIme-VArying interactions
###   between a gene of interest (referred to as "target gene") and a set
###   of genes which may explain the expression of the target gene.
### Aliases: ARTIVAsubnet
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

###
# ARTIVA analysis searching for potential interactions between the target 
# genes and a predefined list of parent genes. 
###

# Note that the number of iterations in the RJ-MCMC sampling is reduced 
# to in this example to 'niter=20000' (in order obtain a quick overview
# of the ARTIVAnet fonction, but it should be increased (e.g. up to
# 50000) for a better parameter estimation.

# Without saving the output pictures "savePictures=FALSE"
## Not run: 
##D ARTIVAtest = ARTIVAsubnet(targetData = simulatedProfiles[targetGene,],
##D   parentData = simulatedProfiles[parentGenes,],
##D   targetName = targetGene,
##D   parentNames = parentGenes,
##D   segMinLength = 2,
##D   edgesThreshold = 0.5, 
##D   niter = 20000,
##D   savePictures=FALSE)
##D 
##D # By default, the output results (pictures and estimation values) are
##D # saved in a folder named "ARTIVAsubnet" created in the current directory
##D ARTIVAtest = ARTIVAsubnet(targetData = simulatedProfiles[targetGene,],
##D   parentData = simulatedProfiles[parentGenes,],
##D   targetName = targetGene,
##D   parentNames = parentGenes,
##D   segMinLength = 2,
##D   edgesThreshold = 0.5, 
##D   niter = 20000)
##D 
##D # In order to save the results in a specific folder, for example a
##D # folder entitled "ARTIVA-test" in the current directory:
##D 
##D ARTIVAtest2 = ARTIVAsubnet(targetData = simulatedProfiles[targetGene,],
##D   parentData = simulatedProfiles[parentGenes,],
##D   targetName = targetGene,
##D   parentNames = parentGenes,
##D   segMinLength = 2,
##D   edgesThreshold = 0.5, 
##D   niter = 20000,
##D   outputPath = "ARTIVA-test")
## End(Not run)



