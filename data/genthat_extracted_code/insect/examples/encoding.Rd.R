library(insect)


### Name: encoding
### Title: Encode and decode profile HMMs in raw byte format.
### Aliases: encoding encodePHMM decodePHMM

### ** Examples

## No test: 
  ## generate a simple classification tree with two child nodes
  data(whales)
  data(whale_taxonomy)
  tree <- learn(whales, db = whale_taxonomy, recursive = FALSE)
  ## extract the omnibus profile HMM from the root node
  PHMM0 <- decodePHMM(attr(tree, "model"))
  ## extract the profile HMM from the first child node
  PHMM1 <- decodePHMM(attr(tree[[1]], "model"))
 
## End(No test)



