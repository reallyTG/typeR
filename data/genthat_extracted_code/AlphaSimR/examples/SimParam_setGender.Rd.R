library(AlphaSimR)


### Name: SimParam_setGender
### Title: Set gender in simulation
### Aliases: SimParam_setGender

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$setGender("yes_sys")




