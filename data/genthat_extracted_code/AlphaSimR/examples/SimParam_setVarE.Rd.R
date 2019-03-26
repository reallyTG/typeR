library(AlphaSimR)


### Name: SimParam_setVarE
### Title: Set simulation error variance
### Aliases: SimParam_setVarE

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitA(10)
SP$setVarE(h2=0.5)




