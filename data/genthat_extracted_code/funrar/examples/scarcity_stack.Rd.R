library(funrar)


### Name: scarcity_stack
### Title: Scarcity
### Aliases: scarcity_stack

### ** Examples

data("aravo", package = "ade4")

# Site-species matrix converted into data.frame
mat = as.matrix(aravo$spe)
mat = make_relative(mat)
dat = matrix_to_stack(mat, "value", "site", "species")
dat$site = as.character(dat$site)
dat$species = as.character(dat$species)

si_df = scarcity_stack(dat, "species", "site", "value")
head(si_df)




