library(rmetasim)


### Name: landscape.Fst
### Title: Calculates population structure statistic for the entire
###   landscape
### Aliases: landscape.Fst
### Keywords: misc

### ** Examples

  exampleland <- landscape.new.example()
  exampleland <- landscape.simulate(exampleland, 4)
  Fst <- landscape.Fst(exampleland,verb=TRUE)
  Fst
  rm(exampleland,Fst)



