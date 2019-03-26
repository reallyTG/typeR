library(fclust)


### Name: unemployment
### Title: Unemployment data
### Aliases: unemployment
### Keywords: data multivariate

### ** Examples

## unemployment data
data(unemployment)
## fuzzy k-means (only spherical clusters)
unempFKM=FKM(unemployment,k=3)
## Gustafson and Kessel-like fuzzy k-means (non-spherical clusters)
unempFKM.gk=FKM.gk(unemployment,k=3,RS=10)


