library(AssotesteR)


### Name: RVT1
### Title: RVT1: Rare Variant Test 1 for dichotomous traits
### Aliases: RVT1

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
##D   # apply RVT1 with maf=0.05 and 500 permutations
##D   myrvt1 = RVT1(phenotype, genotype, maf=0.05, perm=500)
##D   myrvt1
##D   
## End(Not run)



