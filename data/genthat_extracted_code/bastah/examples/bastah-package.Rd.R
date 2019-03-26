library(bastah)


### Name: bastah
### Title: Big Data Statistical Analysis for High-Dimensional Models
### Aliases: bastah
### Keywords: BigQUIC package lasso projection p-values lasso.proj GWAS

### ** Examples

# The package is accompanied with a simulated genome-wide association
# study dataset "snps" containing n=100 observations of p=500 predictors
   data(snps)
# The association of SNPs to the phenotype can be identified using bastah
# NOTE: We have noticed that lars package in R crashes,
# so it is recommended to use scikit-learn (see package details).
## Not run: 
##D       result = bastah(X = snps$X, y = snps$y, family = "binomial", verbose = TRUE)
##D    
## End(Not run)



