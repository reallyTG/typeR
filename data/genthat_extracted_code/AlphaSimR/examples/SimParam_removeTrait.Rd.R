library(AlphaSimR)


### Name: SimParam_removeTrait
### Title: Remove trait
### Aliases: SimParam_removeTrait

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitA(10)
SP$nTraits
SP$removeTrait(1)
SP$nTraits





