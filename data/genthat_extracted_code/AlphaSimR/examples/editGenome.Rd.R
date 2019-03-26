library(AlphaSimR)


### Name: editGenome
### Title: Edit genome
### Aliases: editGenome

### ** Examples

#Create founder haplotypes
founderPop = quickHaplo(nInd=2, nChr=1, segSites=10)

#Set simulation parameters
SP = SimParam$new(founderPop)
SP$addTraitA(10)

#Create population
pop = newPop(founderPop, simParam=SP)

#Change individual 1 to homozygous for the 1 allele 
#at locus 1, chromosome 1
pop2 = editGenome(pop, ind=1, chr=1, segSites=1, 
                  allele=1, simParam=SP)




