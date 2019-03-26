library(plsgenomics)


### Name: sample.cont
### Title: Generates design matrix X with correlated block of covariates
###   and a continuous random reponse Y depening on X through gaussian
###   linear model Y=XB+E
### Aliases: sample.cont

### ** Examples

### load plsgenomics library
library(plsgenomics)

### generating data
n <- 100
p <- 1000
sample1 <- sample.cont(n=n, p=p, kstar=20, lstar=2, beta.min=0.25, beta.max=0.75, mean.H=0.2, 
					sigma.H=10, sigma.F=5, sigma.E=5)
str(sample1)




