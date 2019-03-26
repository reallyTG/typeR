library(ARTIVA)


### Name: traceGeneProfiles
### Title: Function to plot the gene expression profiles
### Aliases: traceGeneProfiles
### Keywords: graphics util

### ** Examples

# Load the R package ARTIVA
library(ARTIVA)

# Load the dataset with simulated gene expression profiles
data(simulatedProfiles)

# Name of the target gene to be analyzed with ARTIVA 
targetGene = 1

# Names of the parent genes (typically transcription factors) 
parentGenes = c("TF1", "TF2", "TF3", "TF4", "TF5")

# Plot of the gene expression profiles for target gene and parent genes
traceGeneProfiles(targetData= simulatedProfiles[targetGene,], 
		  parentData= simulatedProfiles[parentGenes,])




