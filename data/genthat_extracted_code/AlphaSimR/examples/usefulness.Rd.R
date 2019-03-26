library(AlphaSimR)


### Name: usefulness
### Title: Usefulness criterion
### Aliases: usefulness

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=2, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitA(10)

#Create population
pop = newPop(founderPop, simParam=SP)

#Determine usefulness of population 
usefulness(pop, simParam=SP)

#Should be equivalent to GV of best individual
max(gv(pop))




