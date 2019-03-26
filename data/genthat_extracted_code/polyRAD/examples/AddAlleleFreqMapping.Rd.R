library(polyRAD)


### Name: AddAlleleFreqMapping
### Title: Estimate Allele Frequencies in a Mapping Population
### Aliases: AddAlleleFreqMapping AddAlleleFreqMapping.RADdata
### Keywords: methods arith

### ** Examples

# load example dataset
data(exampleRAD_mapping)
exampleRAD_mapping

# specify parents
exampleRAD_mapping <- SetDonorParent(exampleRAD_mapping, "parent1")
exampleRAD_mapping <- SetRecurrentParent(exampleRAD_mapping, "parent2")

# estimate allele frequencies in diploid BC1 population
exampleRAD_mapping <- AddAlleleFreqMapping(exampleRAD_mapping,
                        expectedFreqs = c(0.25, 0.75),
                        allowedDeviation = 0.08)
                        
exampleRAD_mapping$alleleFreq



