library(ThreeWay)


### Name: Kinship
### Title: Kinship terms data
### Aliases: Kinship
### Keywords: data array multivariate

### ** Examples

data(Kinship)
## The labels are in the data array
laba <- dimnames(Kinship)[[1]]
labb <- dimnames(Kinship)[[2]]
labc <- dimnames(Kinship)[[3]]
## Candecomp/Parafac analysis
## Not run: 
##D CP(Kinship,laba,labb,labc)
## End(Not run)



