library(HaploSim)


### Name: SampleHaplotypes
### Title: Simulate a list of haplotypes
### Aliases: SampleHaplotypes
### Keywords: datagen

### ** Examples

hList <- SampleHaplotypes(nHaplotypes = 20,nLoc = 100,genDist =
1,nDec = 3) ## create objects
for(g in 1:10)hList <- SampleHaplotypes(orig = hList,genDist
= 1,nDec = 3)



