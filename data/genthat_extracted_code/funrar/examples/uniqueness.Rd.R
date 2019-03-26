library(funrar)


### Name: uniqueness
### Title: Functional Uniqueness for site-species matrix matrix
### Aliases: uniqueness

### ** Examples

data("aravo", package = "ade4")

# Site-species matrix
mat = as.matrix(aravo$spe)
colnames(mat) = as.character(colnames(mat))

# Example of trait table
tra = aravo$traits[, c("Height", "SLA", "N_mass")]
# Distance matrix
dist_mat = compute_dist_matrix(tra)

ui = uniqueness(mat, dist_mat)
head(ui)

# Computing uniqueness for each community
com_ui = apply(mat, 1,
                function(x, dist_m) {
                    smaller_com = x[x > 0 & !is.na(x)]
                    uniqueness(t(as.matrix(smaller_com)), dist_m)
                }, dist_m = dist_mat)




