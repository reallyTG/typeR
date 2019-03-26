library(AlphaSimR)


### Name: SimParam_setRecRatio
### Title: Set gender specific recombination
### Aliases: SimParam_setRecRatio

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$setRecRatio(2) #Twice as much recombination in females




