library(insect)


### Name: classify
### Title: Tree-based sequence classification.
### Aliases: classify

### ** Examples

## No test: 
  data(whales)
  data(whale_taxonomy)
  ## use all sequences except first one to train the classifier
  set.seed(999)
  tree <- learn(whales[-1], db = whale_taxonomy, maxiter = 5, cores = 2)
  ## find predicted lineage for first sequence
  classify(whales[1], tree)
  ## compare with actual lineage
  taxID <- as.integer(gsub(".+\\|", "", names(whales)[1]))
  get_lineage(taxID, whale_taxonomy)
## End(No test)



