library(jrich)


### Name: IndexW
### Title: W index value for a single topology.
### Aliases: IndexW

### ** Examples

  library(jrich)
  data(tree)
  plot(tree)
  indexw             <- IndexW(tree)
  newTree            <- tree
  newTree$tip.label  <- indexw
  plot(newTree)
  





