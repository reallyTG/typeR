library(rmetasim)


### Name: landscape.new.switchparam
### Title: Create a set of boolean parameters
### Aliases: landscape.new.switchparam
### Keywords: misc

### ** Examples

  ## Defaults
  exampleland <- landscape.new.empty()
  exampleland <- landscape.new.switchparam(exampleland)
  exampleland$switchparam

  ## Random epochs, random demographies, and no multiple paternity
  exampleland <- landscape.new.empty()
  exampleland <- landscape.new.switchparam(exampleland,re=1,rd=1,mp=0)
  exampleland$switchparam

  rm(exampleland)



