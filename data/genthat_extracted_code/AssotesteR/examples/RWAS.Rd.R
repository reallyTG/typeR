library(AssotesteR)


### Name: RWAS
### Title: RWAS: Rare-Variant Weighted Aggregate Statistic
### Aliases: RWAS

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
##D   set.seed(1234)  
##D   genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)
##D 
##D   # apply RWAS with maf=0.05 and 500 permutations
##D   myrwas = RWAS(phenotype, genotype, maf=0.05, perm=500)
##D   myrwas
##D   
## End(Not run)



