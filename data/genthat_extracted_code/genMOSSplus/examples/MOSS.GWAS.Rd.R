library(genMOSSplus)


### Name: MOSS.GWAS
### Title: A function implementing the MOSS algorithm for the analysis of
###   GWAS data.
### Aliases: MOSS.GWAS
### Keywords: htest models

### ** Examples

m <- as.data.frame(matrix(round(runif(100)), 5))
MOSS.GWAS (replicates = 1, maxVars = 3, data = m, dimens = c(rep(2,19),2), k = 2)



