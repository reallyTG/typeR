library(ARTIVA)


### Name: simulatedProfiles
### Title: Simulated gene expression profiles dataset.
### Aliases: simulatedProfiles
### Keywords: datasets

### ** Examples


# Load the ARTIVA R package
library(ARTIVA)

# Load the simulated profiles dataset
data(simulatedProfiles)

# Name of the target gene to be analyzed with ARTIVA 
targetGene = 1

# Names of the parent genes (typically transcription factors) 
parentGenes = c("TF1", "TF2", "TF3", "TF4", "TF5")

# Plot of the gene expression profiles for target gene and parent genes
traceGeneProfiles(targetData= simulatedProfiles[targetGene,], 
		  parentData= simulatedProfiles[parentGenes,])

###
# ARTIVA analysis searching for potential interactions between the target 
# genes and a predefined list of parent genes. 
###

# Note that the number of iterations in the RJ-MCMC sampling is reduced 
# to in this example to 'niter=20000' in order obtain a quick overview of
# the ARTIVAnet fonction, but it should be increased (e.g. up to 50000)
# for a better parameter estimation.
## Not run: 
##D ARTIVAtest = ARTIVAsubnet(targetData = simulatedProfiles[targetGene,],
##D   parentData = simulatedProfiles[parentGenes,],
##D   targetName = targetGene,
##D   parentNames = parentGenes,
##D   niter = 5000,
##D   savePictures = FALSE)
## End(Not run)



