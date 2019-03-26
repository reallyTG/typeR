library(AlphaSimR)


### Name: SimParam_setTrackPed
### Title: Set pedigree tracking
### Aliases: SimParam_setTrackPed

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$setTrackPed(TRUE)




