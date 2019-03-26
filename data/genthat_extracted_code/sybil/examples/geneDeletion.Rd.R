library(sybil)


### Name: geneDeletion
### Title: Gene Deletion Experiments
### Aliases: geneDeletion
### Keywords: optimize

### ** Examples

  ## load the dataset
  data(Ec_core)
  
  ## perform a single gene deletion analysis
  ## (delete every gene one by one) via FBA
  gd <- geneDeletion(Ec_core)
  
  ## or via MOMA (linearized version)
  gd <- geneDeletion(Ec_core, algorithm = "lmoma")
  
  ## triple gene deletion analysis using the first ten genes
  gd <- geneDeletion(Ec_core, genes = 10, combinations = 3)

## Not run: 
##D   ## perform a double gene deletion analysis
##D   ##(delete all possible pairwise combinations of all genes)
##D   gd <- geneDeletion(Ec_core, combinations = 2)
##D 
##D   ## perform a triple gene deletion analysis
##D   ## (very high number of optimizations)
##D   gd <- geneDeletion(Ec_core, combinations = 3)
## End(Not run)



