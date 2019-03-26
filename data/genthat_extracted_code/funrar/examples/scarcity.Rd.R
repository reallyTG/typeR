library(funrar)


### Name: scarcity
### Title: Scarcity on site-species matrix
### Aliases: scarcity

### ** Examples

data("aravo", package = "ade4")
# Site-species matrix
mat = as.matrix(aravo$spe)
mat = make_relative(mat)

si = scarcity(pres_matrix = mat)
si[1:5, 1:5]




