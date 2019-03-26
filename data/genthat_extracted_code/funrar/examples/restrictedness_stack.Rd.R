library(funrar)


### Name: restrictedness_stack
### Title: Geographical Restrictedness for stacked data.frame
### Aliases: restrictedness_stack

### ** Examples

data("aravo", package = "ade4")

# Site-species matrix converted into data.frame
mat = as.matrix(aravo$spe)
dat = matrix_to_stack(mat, "value", "site", "species")
dat$site = as.character(dat$site)
dat$species = as.character(dat$species)
ri_df = restrictedness_stack(dat, "species", "site")
head(ri_df)




