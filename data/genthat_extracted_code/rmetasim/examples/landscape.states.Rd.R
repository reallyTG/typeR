library(rmetasim)


### Name: landscape.states
### Title: return a matrix containing actual genotypes for a particular
###   locus
### Aliases: landscape.states
### Keywords: misc

### ** Examples

  exampleland <- landscape.new.example()
  exampleland <- landscape.simulate(exampleland, 4)
  print("Allele frequencies at locus 1")
  table(landscape.states(exampleland,1)[,c(-1:-landscape.democol())]) 
  rm(exampleland)



