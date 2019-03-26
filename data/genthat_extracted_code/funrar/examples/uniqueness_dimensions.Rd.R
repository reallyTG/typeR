library(funrar)


### Name: uniqueness_dimensions
### Title: Uniqueness dimensions
### Aliases: uniqueness_dimensions

### ** Examples

data("aravo", package = "ade4")

# Site-species matrix
mat = as.matrix(aravo$spe)
rel_mat = make_relative(mat)

# Example of trait table
tra = aravo$traits[, c("Height", "SLA", "N_mass")]

ui_dim = uniqueness_dimensions(rel_mat, tra)




