library(vegan)


### Name: dispindmorisita
### Title: Morisita index of intraspecific aggregation
### Aliases: dispindmorisita
### Keywords: multivariate spatial

### ** Examples

data(dune)
x <- dispindmorisita(dune)
x
y <- dispindmorisita(dune, unique.rm = TRUE)
y
dim(x) ## with unique species
dim(y) ## unique species removed



