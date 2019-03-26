library(AlphaSimR)


### Name: SimParam_addTraitA
### Title: Add additive traits
### Aliases: SimParam_addTraitA

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitA(10)




