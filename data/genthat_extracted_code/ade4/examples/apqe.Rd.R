library(ade4)


### Name: apqe
### Title: Apportionment of Quadratic Entropy
### Aliases: apqe print.apqe
### Keywords: multivariate

### ** Examples

data(ecomor)
ecomor.phylog <- taxo2phylog(ecomor$taxo)
apqe(ecomor$habitat, ecomor.phylog$Wdist)



