library(AlphaSimR)


### Name: SimParam_rescaleTraits
### Title: Rescale traits
### Aliases: SimParam_rescaleTraits

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitA(10)

#Create population
pop = newPop(founderPop, simParam=SP)
meanG(pop)

#Change mean to 1
SP$rescaleTraits(pop, mean=1)
#Run resetPop for chage to take effect
pop = resetPop(pop, simParam=SP) 
meanG(pop)




