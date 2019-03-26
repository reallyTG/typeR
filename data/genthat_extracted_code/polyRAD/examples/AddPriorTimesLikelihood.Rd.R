library(polyRAD)


### Name: AddPriorTimesLikelihood
### Title: Multiply Genotype Prior Probabilities by Genotype Likelihoods
### Aliases: AddPriorTimesLikelihood
### Keywords: arith array methods

### ** Examples

# load dataset and set some parameters
data(exampleRAD_mapping)
exampleRAD_mapping <- SetDonorParent(exampleRAD_mapping, "parent1")
exampleRAD_mapping <- SetRecurrentParent(exampleRAD_mapping, "parent2")
exampleRAD_mapping <- AddAlleleFreqMapping(exampleRAD_mapping,
                                           expectedFreqs = c(0.25, 0.75),
                                           allowedDeviation = 0.08)
exampleRAD_mapping <- AddGenotypeLikelihood(exampleRAD_mapping)
exampleRAD_mapping <- AddGenotypePriorProb_Mapping2Parents(exampleRAD_mapping,
                                                      n.gen.backcrossing = 1)
                                                      
# perform the multiplication
exampleRAD_mapping <- AddPriorTimesLikelihood(exampleRAD_mapping)
# examine the results
exampleRAD_mapping$priorTimesLikelihood[[1]][,50,] # for one progeny
exampleRAD_mapping$priorTimesLikelihood[[1]][,1,]
 # --> for the donor parent; not a good idea to use since the priors 
 #    aren't appropriate



