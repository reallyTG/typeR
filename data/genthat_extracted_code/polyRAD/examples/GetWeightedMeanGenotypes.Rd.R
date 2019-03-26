library(polyRAD)


### Name: GetWeightedMeanGenotypes
### Title: Export Numeric Genotype Values from Posterior Probabilities
### Aliases: GetWeightedMeanGenotypes GetWeightedMeanGenotypes.RADdata
###   GetProbableGenotypes GetProbableGenotypes.RADdata
### Keywords: methods array

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
exampleRAD_mapping <- AddGenotypePosteriorProb(exampleRAD_mapping)
exampleRAD_mapping <- AddPloidyChiSq(exampleRAD_mapping)

# get weighted mean genotypes
wmg <- GetWeightedMeanGenotypes(exampleRAD_mapping)
# examine the results
wmg[1:10,]

# get most probable genotypes
pg <- GetProbableGenotypes(exampleRAD_mapping, naIfZeroReads = TRUE)
# examine the results
pg$genotypes[1:10,]



