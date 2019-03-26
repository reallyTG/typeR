library(ade4)


### Name: divc
### Title: Rao's diversity coefficient also called quadratic entropy
### Aliases: divc
### Keywords: multivariate

### ** Examples

data(ecomor)
dtaxo <- dist.taxo(ecomor$taxo)
divc(ecomor$habitat, dtaxo)

data(humDNAm)
divc(humDNAm$samples, sqrt(humDNAm$distances))



