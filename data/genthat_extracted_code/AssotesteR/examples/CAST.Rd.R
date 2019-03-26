library(AssotesteR)


### Name: CAST
### Title: CAST: Cohort Allelic Sums Test
### Aliases: CAST

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
##D   # apply CAST with fisher exact test 
##D   mycast1 = CAST(phenotype, genotype, maf=0.05, test = "fisher")
##D   mycast1
##D 
##D   # apply CAST with chi-square test 
##D   mycast2 = CAST(phenotype, genotype, maf=0.05, test = "chisq")
##D   mycast2
##D   
## End(Not run)



