library(ade4)


### Name: disc
### Title: Rao's dissimilarity coefficient
### Aliases: disc
### Keywords: multivariate

### ** Examples

data(humDNAm)
humDNA.dist <- disc(humDNAm$samples, sqrt(humDNAm$distances), humDNAm$structures)
humDNA.dist
is.euclid(humDNA.dist$samples)
is.euclid(humDNA.dist$regions)

## Not run: 
##D data(ecomor)
##D dtaxo <- dist.taxo(ecomor$taxo)
##D ecomor.dist <- disc(ecomor$habitat, dtaxo)
##D ecomor.dist
##D is.euclid(ecomor.dist)
## End(Not run)



