library(alleHap)


### Name: alleSimulator
### Title: Simulation of genetic data (alleles) and non-genetic data
###   (family identifiers)
### Aliases: alleSimulator

### ** Examples


## Generation of 5 simulated families with 2 children per family and 10 markers
simulatedFams <- alleSimulator(5,2,10)   # List with simulated alleles and haplotypes
simulatedFams[[1]]                       # Alleles (genotypes) of the simulated families
simulatedFams[[2]]                       # Haplotypes of the simulated families




