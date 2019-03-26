library(AlphaSimR)


### Name: SimParam_addTraitADG
### Title: Add an additive and dominance GxE trait
### Aliases: SimParam_addTraitADG

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitADG(10, meanDD=0.5, varGxE=2)




