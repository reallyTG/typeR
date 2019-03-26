library(funrar)


### Name: distinctiveness
### Title: Functional Distinctiveness on site-species matrix
### Aliases: distinctiveness

### ** Examples

data("aravo", package = "ade4")
# Site-species matrix
mat = as.matrix(aravo$spe)

# Compute relative abundances
mat = make_relative(mat)

# Example of trait table
tra = aravo$traits[, c("Height", "SLA", "N_mass")]
# Distance matrix
dist_mat = compute_dist_matrix(tra)

di = distinctiveness(pres_matrix = mat, dist_matrix = dist_mat)
di[1:5, 1:5]

# Compute distinctiveness for all species in the regional pool
# i.e., with all the species in all the communities
# Here considering each species present evenly in the regional pool
reg_pool = matrix(1, ncol = ncol(mat))
colnames(reg_pool) = colnames(mat)
row.names(reg_pool) = c("Regional_pool")

reg_di = distinctiveness(reg_pool, dist_mat)




