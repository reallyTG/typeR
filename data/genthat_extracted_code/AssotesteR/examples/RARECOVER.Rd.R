library(AssotesteR)


### Name: RARECOVER
### Title: RARECOVER Algorithm
### Aliases: RARECOVER

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
##D   # apply RARECOVER with dif=0.05 and 500 permutations
##D   myrc = RARECOVER(phenotype, genotype, maf=0.05, perm=500)
##D   myrc
##D   
## End(Not run)



