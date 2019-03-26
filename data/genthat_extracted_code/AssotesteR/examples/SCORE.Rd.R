library(AssotesteR)


### Name: SCORE
### Title: SCORE: Score Test (from Logistic Regression)
### Aliases: SCORE

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
##D   # phenotype (first column of genodata)
##D   phenotype = c(rep(1, cases), rep(0, controls))
##D 
##D   # genotype matrix with 10 variants (random data)
##D   set.seed(123)
##D   genotype = matrix(rbinom(total*10, 2, 0.05), nrow=total, ncol=10)
##D 
##D   # apply SCORE with 500 permutations
##D   myscore = SCORE(phenotype, genotype, perm=500)
##D   myscore
##D   
## End(Not run)



