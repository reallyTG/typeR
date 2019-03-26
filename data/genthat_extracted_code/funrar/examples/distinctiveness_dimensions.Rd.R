library(funrar)


### Name: distinctiveness_dimensions
### Title: Distinctiveness dimensions
### Aliases: distinctiveness_dimensions

### ** Examples

data("aravo", package = "ade4")

# Site-species matrix
mat = as.matrix(aravo$spe)
rel_mat = make_relative(mat)

# Example of trait table
tra = aravo$traits[, c("Height", "SLA", "N_mass")]

di_dim = distinctiveness_dimensions(rel_mat, tra)




