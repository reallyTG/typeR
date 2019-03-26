library(genMOSS)


### Name: MOSS_GWAS
### Title: Analyzing GWAS data using MOSS
### Aliases: MOSS_GWAS
### Keywords: htest models

### ** Examples

data(simuCC)
data <- simuCC[,c(1002,2971,rep(5978:6001))]
# The SNPs in columns 1002 and 2971 of simuCC called rs4491689 and rs6869003 cause the disease.
set.seed(7)
MOSS_GWAS (alpha = 1, c = 0.1, cPrime = 0.0001, q = 0.1, replicates = 1, 
           maxVars = 3, data, dimens = c(rep(3,25),2), confVars = NULL, k = NULL)



