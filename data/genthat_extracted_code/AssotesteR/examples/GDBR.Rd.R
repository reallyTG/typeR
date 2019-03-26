library(AssotesteR)


### Name: GDBR
### Title: GDBR: Genomic Distance-Based Regression
### Aliases: GDBR

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
##D   phenotype = c(rep(1,cases), rep(0,controls))
##D 
##D   # genotype matrix with 10 variants (random data)
##D   set.seed(123)
##D   genotype = matrix(rbinom(total*10, 2, 0.05), nrow=total, ncol=10)
##D 
##D   # apply GDBR with 50 permutations
##D   # (it takes some time to run the permutations!)
##D   mygdbr = GDBR(phenotype, genotype, perm=50)
##D   mygdbr
##D   
## End(Not run)



