library(plsgenomics)


### Name: sample.bin
### Title: Generates covariate matrix X with correlated block of covariates
###   and a binary random reponse depening on X through a logistic model
### Aliases: sample.bin

### ** Examples

### load plsgenomics library
library(plsgenomics)

### generating data
n <- 100
p <- 1000
sample1 <- sample.bin(n=n, p=p, kstar=20, lstar=2, beta.min=0.25, 
                      beta.max=0.75, mean.H=0.2, 
                      sigma.H=10, sigma.F=5)

str(sample1)




