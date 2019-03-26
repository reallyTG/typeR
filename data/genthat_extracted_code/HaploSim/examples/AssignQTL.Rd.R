library(HaploSim)


### Name: AssignQTL
### Title: Assigns QTL to a list of Haplotypes
### Aliases: AssignQTL ListQTL
### Keywords: datagen

### ** Examples

hList <- SampleHaplotypes(nHaplotypes = 20,nLoc = 100,genDist =
1,nDec = 3) ## create objects
 hListd <- SampleHaplotypes(orig = hList,genDist = 1,nDec = 3)
hListQTL <- AssignQTL(hList,frqtl = 0.1,MAF = 0.0)
hListd <- SampleHaplotypes(orig = hListQTL,genDist = 1,nDec
= 3,QTL = TRUE)
qtlList <- ListQTL(hList,frqtl = 0.1,MAF = 0.0)



