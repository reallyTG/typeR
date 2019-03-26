library(AlphaSimR)


### Name: sampleHaplo
### Title: Sample haplotypes from a MapPop
### Aliases: sampleHaplo

### ** Examples

# Create genetic map for a single chromosome with 1 Morgan
# Chromosome contains 11 equally spaced segregating sites
genMap = list(seq(0,1,length.out=11))
founderPop = trackHaploPop(genMap=genMap,nInd=2,inbred=TRUE)
founderPop = sampleHaplo(nInd=20,mapPop=founderPop)




