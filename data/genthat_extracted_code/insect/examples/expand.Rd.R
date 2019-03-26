library(insect)


### Name: expand
### Title: Expand an existing classification tree.
### Aliases: expand

### ** Examples

## No test: 
  data(whales)
  data(whale_taxonomy)
  ## split the first node
  set.seed(123)
  tree <- learn(whales, db = whale_taxonomy, recursive = FALSE)
  ## expand only the first clade
  tree <- expand(tree, clades = "1")
 
## End(No test)



