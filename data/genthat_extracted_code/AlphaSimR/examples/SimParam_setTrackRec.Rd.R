library(AlphaSimR)


### Name: SimParam_setTrackRec
### Title: Set recombination tracking
### Aliases: SimParam_setTrackRec

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$setTrackRec(TRUE)




