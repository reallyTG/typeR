library(AssotesteR)


### Name: CMAT
### Title: CMAT: Cumulative Minor Allele Test
### Aliases: CMAT

### ** Examples

  ## Not run: 
##D   
##D   # number of cases
##D   cases = 500
##D 
##D   # number of controls
##D   controls = 500
##D 
##D   # total (cases + controls)
##D   total = cases + controls
##D 
##D   # phenotype vector
##D   phenotype = c(rep(1,cases), rep(0,controls))
##D 
##D   # genotype matrix with 10 variants (random data)
##D   set.seed(1234)
##D   genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)
##D 
##D   # apply CMAT with 500 permutations
##D   mycmat1 = CMAT(phenotype, genotype, perm=500)
##D   mycmat1
##D 
##D   # apply CMAT with maf=0.05 and 500 permutations
##D   mycmat2 = CMAT(phenotype, genotype, maf=0.05, perm=500)
##D   mycmat2
##D   
## End(Not run)



