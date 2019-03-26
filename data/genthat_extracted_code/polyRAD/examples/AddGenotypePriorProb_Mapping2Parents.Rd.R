library(polyRAD)


### Name: AddGenotypePriorProb_Mapping2Parents
### Title: Expected Genotype Frequencies in Mapping Populations
### Aliases: AddGenotypePriorProb_Mapping2Parents
###   AddGenotypePriorProb_Mapping2Parents.RADdata
### Keywords: methods distribution

### ** Examples

# load dataset and set some parameters
data(exampleRAD_mapping)
exampleRAD_mapping <- SetDonorParent(exampleRAD_mapping, "parent1")
exampleRAD_mapping <- SetRecurrentParent(exampleRAD_mapping, "parent2")
exampleRAD_mapping <- AddAlleleFreqMapping(exampleRAD_mapping,
                                           expectedFreqs = c(0.25, 0.75),
                                           allowedDeviation = 0.08)
exampleRAD_mapping <- AddGenotypeLikelihood(exampleRAD_mapping)

# examine the dataset
exampleRAD_mapping
exampleRAD_mapping$alleleFreq

# estimate genotype priors for a BC1 population
exampleRAD_mapping <- AddGenotypePriorProb_Mapping2Parents(exampleRAD_mapping,
                                                      n.gen.backcrossing = 1)
exampleRAD_mapping$priorProb



