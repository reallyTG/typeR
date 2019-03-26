library(nFactors)


### Name: dFactors
### Title: Eigenvalues Vectors From the Litterature
### Aliases: dFactors
### Keywords: datasets

### ** Examples

# EXAMPLES FROM DATASET
 data(dFactors)

# COMMAND TO VISUALIZE THE CONTENT AND ATTRIBUTES OF THE DATASETS
 names(dFactors)
 attributes(dFactors)
 dFactors$Cliff1$eigenvalues
 dFactors$Cliff1$nsubjects

# SCREE PLOT
 plotuScree(dFactors$Cliff1$eigenvalues)
 


