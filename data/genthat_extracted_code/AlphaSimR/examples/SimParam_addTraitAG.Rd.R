library(AlphaSimR)


### Name: SimParam_addTraitAG
### Title: Add additive GxE traits
### Aliases: SimParam_addTraitAG

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitAG(10, varGxE=2)




