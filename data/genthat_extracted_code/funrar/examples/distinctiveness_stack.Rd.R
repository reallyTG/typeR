library(funrar)


### Name: distinctiveness_stack
### Title: Functional Distinctiveness on a stacked data.frame
### Aliases: distinctiveness_stack

### ** Examples

data("aravo", package = "ade4")

# Example of trait table
tra = aravo$traits[, c("Height", "SLA", "N_mass")]
# Distance matrix
dist_mat = compute_dist_matrix(tra)

# Site-species matrix converted into data.frame
mat = as.matrix(aravo$spe)
mat = make_relative(mat)
dat = matrix_to_stack(mat, "value", "site", "species")
dat$site = as.character(dat$site)
dat$species = as.character(dat$species)

di_df = distinctiveness_stack(dat, "species", "site", "value", dist_mat)
head(di_df)




