library(AlphaSimR)


### Name: pullSnpGeno
### Title: Pull SNP genotype
### Aliases: pullSnpGeno

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitA(10)
SP$addSnpChip(5)

#Create population
pop = newPop(founderPop, simParam=SP)
pullSnpGeno(pop, simParam=SP)




