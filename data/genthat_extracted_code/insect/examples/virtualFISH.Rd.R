library(insect)


### Name: virtualFISH
### Title: Virtual _in situ_ hybridization.
### Aliases: virtualFISH

### ** Examples

  ## ensure whale sequences are globally alignable
  data(whales)
  model <- aphid::derivePHMM(whales)
  z <- virtualFISH(whales, probe = model)



