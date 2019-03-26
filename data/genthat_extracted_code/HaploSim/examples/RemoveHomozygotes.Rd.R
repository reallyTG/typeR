library(HaploSim)


### Name: RemoveHomozygotes
### Title: Remove the homozygotic snp loci from a list of haplotypes
### Aliases: RemoveHomozygotes
### Keywords: datagen

### ** Examples

hList <- SampleHaplotypes(nHaplotypes = 20,nLoc = 100,genDist =
1,nDec = 3) ## create objects
hList <- RemoveHomozygotes(hList)



