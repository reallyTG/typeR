library(HaploSim)


### Name: buildhPedigree
### Title: Build a haplotype pedrigree from a haplotype list
### Aliases: buildhPedigree
### Keywords: datagen

### ** Examples

example(SampleHaplotypes)
hPedigree <- buildhPedigree(hList = hList)
for(g in 1:10)
  {
    hList <- SampleHaplotypes(orig = hList,genDist
        = 1,roundDec = 3)
    hPedigree <- buildhPedigree(hPedigree=hPedigree,hList = hList)
  }



