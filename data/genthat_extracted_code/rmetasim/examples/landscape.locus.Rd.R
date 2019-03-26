library(rmetasim)


### Name: landscape.locus
### Title: return a matrix containing genotypes for a particular locus
### Aliases: landscape.locus
### Keywords: misc

### ** Examples

  exampleland <- landscape.new.example()
  exampleland <- landscape.simulate(exampleland, 4)
  print("Allele frequencies at locus 1")
  table(landscape.locus(exampleland,1)[,c(-1:-(landscape.democol()))]) 
  rm(exampleland)



