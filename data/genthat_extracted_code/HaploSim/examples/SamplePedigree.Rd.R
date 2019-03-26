library(HaploSim)


### Name: SamplePedigree
### Title: Simulate a haplotypes in a pedigree
### Aliases: SamplePedigree
### Keywords: datagen

### ** Examples

example(SampleHaplotypes)
ID <- 1:10
pID0 <- c(rep(0,5),1,1,3,3,5)
pID1 <- c(rep(0,4),2,2,2,4,4,6)
ped <- data.frame(ID,pID0,pID1)
phList <- SamplePedigree(orig = hList,ped = ped)



