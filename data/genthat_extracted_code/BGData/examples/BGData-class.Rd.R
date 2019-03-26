library(BGData)


### Name: BGData-class
### Title: An S4 Class to Represent Phenotype and Genotype Data.
### Aliases: BGData-class BGData

### ** Examples

X <- matrix(data = rnorm(100), nrow = 10, ncol = 10)
Y <- data.frame(y = runif(10))
MAP <- data.frame(means = colMeans(X), freqNA = colMeans(is.na(X)))
DATA <- BGData(geno = X, pheno = Y, map = MAP)

dim(DATA@geno)
head(DATA@pheno)
head(DATA@map)



