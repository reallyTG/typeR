library(funrar)


### Name: make_relative
### Title: Relative abundance matrix from absolute abundance matrix
### Aliases: make_relative

### ** Examples

data("aravo", package = "ade4")

# Site-species matrix
mat = as.matrix(aravo$spe)
head(mat)[, 1:5]  # Has absolute abundances
rel_mat = make_relative(mat)
head(rel_mat)  # Relative abundances




