library(rmetasim)


### Name: landscape.new.floatparam
### Title: Create a set of floating point parameters
### Aliases: landscape.new.floatparam
### Keywords: misc

### ** Examples

  ## Defaults
  exampleland <- landscape.new.empty()
  exampleland <- landscape.new.floatparam(exampleland)
  exampleland$floatparam

  ## .5 selfing rate
  exampleland <- landscape.new.empty()
  exampleland <- landscape.new.floatparam(exampleland,s=0.5)
  exampleland$floatparam

  rm(exampleland)



