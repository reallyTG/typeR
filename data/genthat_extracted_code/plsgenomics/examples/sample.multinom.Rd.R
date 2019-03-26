library(plsgenomics)


### Name: sample.multinom
### Title: Generates covariate matrix X with correlated block of covariates
###   and a multi-label random reponse depening on X through a multinomial
###   model
### Aliases: sample.multinom

### ** Examples

### load plsgenomics library
library(plsgenomics)

### generating data
n <- 100
p <- 1000
nclass <- 3
sample1 <- sample.multinom(n=n, p=p, nb.class=nclass,
                           kstar=20, lstar=2, beta.min=0.25,
                           beta.max=0.75, mean.H=0.2,
                           sigma.H=10, sigma.F=5)

str(sample1)




