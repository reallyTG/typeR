library(sybil)


### Name: doubleGeneDel
### Title: Double Gene Deletion Experiment
### Aliases: doubleGeneDel
### Keywords: optimize

### ** Examples

## Not run: 
##D   ## compute all possible pairwise gene deletions
##D   # load example data set
##D   data(Ec_core)
##D   
##D   # compute all possible pairwise gene deletions via
##D   # FBA (default)
##D   Ec_dgd <- doubleGeneDel(Ec_core, allComb = TRUE)
##D   
##D   # or MOMA (linearized version)
##D   Ec_dgd <- doubleGeneDel(Ec_core,
##D                           allComb = TRUE,
##D                           algorithm = "lmoma")
## End(Not run)



