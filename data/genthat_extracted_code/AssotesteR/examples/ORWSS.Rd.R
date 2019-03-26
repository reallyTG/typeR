library(AssotesteR)


### Name: ORWSS
### Title: ORWSS: Odds Ratio Weighted Sum Statistic
### Aliases: ORWSS

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
##D   # apply ORWSS with c.param=NULL and 500 permutations
##D   myorwss1 = ORWSS(phenotype, genotype, c.param=NULL, perm=100)
##D   myorwss1
##D 
##D   # apply ORWSS with c.param=1.64 (see Feng et al 2011)
##D   myorwss2 = ORWSS(phenotype, genotype, c.param=1.64, perm=100)
##D   myorwss2
##D   
## End(Not run)



