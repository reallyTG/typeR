library(nCopula)


### Name: rCop
### Title: Random number generator for Archimedean copula class objects
### Aliases: rCop

### ** Examples

## Create the trivariate archm copula object
cop <- Clayton(5, 3)

## Generate the samples
res <- rCop(10000, cop)

## Plot the values
pairs(res, pch = 16, cex = 0.7)




