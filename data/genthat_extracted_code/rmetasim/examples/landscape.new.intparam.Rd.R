library(rmetasim)


### Name: landscape.new.intparam
### Title: Create a set of integer parameters
### Aliases: landscape.new.intparam
### Keywords: misc

### ** Examples

  ## Defaults
  exampleland <- landscape.new.empty()
  exampleland <- landscape.new.intparam(exampleland)
  exampleland$intparam

  ## 2 habitats, 3 stage lifecycle, 1000000 generations, maximum 1000000 individuals
  exampleland <- landscape.new.empty()
  exampleland <- landscape.new.intparam(exampleland,h=2,s=2,totgen=1000000,maxland=1000000)
  exampleland$intparam

  rm(exampleland)



