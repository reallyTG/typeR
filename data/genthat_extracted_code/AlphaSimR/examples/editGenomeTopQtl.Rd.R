library(AlphaSimR)


### Name: editGenomeTopQtl
### Title: Edit genome - the top QTL
### Aliases: editGenomeTopQtl

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=2, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitA(10)

#Create population
pop = newPop(founderPop, simParam=SP)

#Change up to 10 loci for individual 1 
pop2 = editGenomeTopQtl(pop, ind=1, nQtl=10, simParam=SP)
                  



