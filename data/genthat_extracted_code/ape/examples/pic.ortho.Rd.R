library(ape)


### Name: pic.ortho
### Title: Phylogenetically Independent Orthonormal Contrasts
### Aliases: pic.ortho
### Keywords: regression

### ** Examples

tr <- rcoal(30)
### a single observation per species:
x <- rTraitCont(tr)
pic.ortho(x, tr)
pic.ortho(x, tr, TRUE)
### different number of observations per species:
x <- lapply(sample(1:5, 30, TRUE), rnorm)
pic.ortho(x, tr, intra = TRUE)



