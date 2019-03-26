library(rmetasim)


### Name: landscape.new.locus
### Title: Add a locus
### Aliases: landscape.new.locus
### Keywords: misc

### ** Examples

  exampleland <- landscape.new.empty()
  exampleland <- landscape.new.intparam(exampleland, s=2, h=2)
  exampleland <- landscape.new.floatparam(exampleland)
  exampleland <- landscape.new.switchparam(exampleland)

  exampleland <- landscape.new.locus(exampleland,type=2,ploidy=2,
                          mutationrate=.001,numalleles=5,allelesize=100)

  exampleland$loci

  rm(exampleland)



