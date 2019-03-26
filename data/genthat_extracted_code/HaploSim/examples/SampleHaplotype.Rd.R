library(HaploSim)


### Name: SampleHaplotype
### Title: Simulate a haplotype
### Aliases: SampleHaplotype
### Keywords: datagen

### ** Examples

hList <- SampleHaplotypes(nHaplotypes = 20,genDist =
1,nDec = 3,nLoc = 20) ## create objects
h <- SampleHaplotype(H0 = hList[[1]],H1 = hList[[2]],genDist =
1,nDec = 3)



