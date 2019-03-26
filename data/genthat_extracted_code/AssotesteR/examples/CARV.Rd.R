library(AssotesteR)


### Name: CARV
### Title: CARV: Comprehrensive Approach to Analyzing Rare Variants
### Aliases: CARV

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
##D   # define genotype matrix with 10 variants (random data)
##D   set.seed(1234)
##D   genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)
##D 
##D   # apply CARV with "hard" approach and maf=0.05
##D   mycarv1 = CARV(phenotype, genotype, waf=FALSE, signs=FALSE, 
##D      approach="hard", maf=0.05, perm=500)
##D   mycarv1
##D 
##D   # apply CARV with "variable" approach and waf=TRUE
##D   mycarv2 = CARV(phenotype, genotype, waf=TRUE, signs=FALSE,
##D      approach="variable", perm=500)
##D   mycarv2
##D 
##D   # apply CARV with "stepup" approach, waf=TRUE, and signs=TRUE
##D   mycarv3 = CARV(phenotype, genotype, waf=TRUE, signs=TRUE,
##D      approach="stepup", perm=500)
##D   mycarv3
##D 
##D   
## End(Not run)



