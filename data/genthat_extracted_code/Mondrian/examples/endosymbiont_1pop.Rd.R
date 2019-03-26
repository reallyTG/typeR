library(Mondrian)


### Name: endosymbiont_1pop
### Title: Multiple infection profiles in one population
### Aliases: endosymbiont_1pop
### Keywords: datasets

### ** Examples

  data(endosymbiont_1pop)
  
  ## Compute the occurrence table of multiple infection profiles
  rev(table(apply(endosymbiont_1pop, 1, paste, collapse = "")))
  
  ## 110 011 010 
  ##   6   2   2



