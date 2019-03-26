library(AssotesteR)


### Name: MULTI
### Title: MULTI: Multiple Tests
### Aliases: MULTI

### ** Examples

  ## Not run: 
##D   
##D   # number of cases
##D   cases = 250
##D 
##D   # number of controls
##D   controls = 250
##D 
##D   # total (cases + controls)
##D   total = cases + controls
##D 
##D   # phenotype vector
##D   phenotype = c(rep(1, cases), rep(0, controls))
##D 
##D   # genotype matrix with 10 variants (random data)
##D   set.seed(1234)
##D   genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)
##D 
##D   # apply MULTI with "BST", "CMC", "RWAS" and 100 permutations
##D   mymulti1 = MULTI(phenotype, genotype, c("BST", "CMC", "RWAS"), perm=100)
##D   
##D   # this is what we get
##D   mymulti1
##D 
##D   # create list with the following tests
##D   test_list = c("BST", "CMC", "CMAT", "CALPHA", "ORWSS", "RWAS",
##D       "RBT", "SCORE", "SUM", "SSU", "SSUW", "UMINP", "WSS", "WST")
##D 
##D   # apply MULTI with 100 permutations
##D   mymulti2 = MULTI(phenotype, genotype, test_list, perm=100)
##D 
##D   # this is what we get
##D   mymulti2
##D   
## End(Not run)



