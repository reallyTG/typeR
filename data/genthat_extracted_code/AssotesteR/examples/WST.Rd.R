library(AssotesteR)


### Name: WST
### Title: WST: Weighted Score Test
### Aliases: WST

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
##D   phenotype = c(rep(1, cases), rep(0, controls))
##D 
##D   # genotype matrix with 10 variants (random data)
##D   set.seed(123)
##D   genotype = matrix(rbinom(total*10, 2, 0.05), nrow=total, ncol=10)
##D 
##D   # apply WST with 500 permutations
##D   mywst = WST(phenotype, genotype, perm=500)
##D   mywst
##D   
## End(Not run)



