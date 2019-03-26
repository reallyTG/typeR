library(AlphaSimR)


### Name: SimParam_addTraitAD
### Title: Add additive and dominance traits
### Aliases: SimParam_addTraitAD

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitAD(10, meanDD=0.5)




