library(funrar)


### Name: uniqueness_stack
### Title: Functional Uniqueness on stacked data.frame
### Aliases: uniqueness_stack

### ** Examples

data("aravo", package = "ade4")

# Site-species matrix converted into data.frame
mat = as.matrix(aravo$spe)
dat = matrix_to_stack(mat, "value", "site", "species")
dat$site = as.character(dat$site)
dat$species = as.character(dat$species)

# Example of trait table
tra = aravo$traits[, c("Height", "SLA", "N_mass")]
# Distance matrix
dist_mat = compute_dist_matrix(tra)

ui_df = uniqueness_stack(dat, "species", dist_mat)
head(ui_df)




