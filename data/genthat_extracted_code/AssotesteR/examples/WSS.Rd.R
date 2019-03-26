library(AssotesteR)


### Name: WSS
### Title: WSS: Weighted Sum Statistic
### Aliases: WSS

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
##D   # apply WSS with 500 permutations
##D   mywss = WSS(phenotype, genotype, perm=500)
##D   mywss
##D   
## End(Not run)



