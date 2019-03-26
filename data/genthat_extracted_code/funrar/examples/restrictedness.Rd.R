library(funrar)


### Name: restrictedness
### Title: Geographical Restrictedness on site-species matrix
### Aliases: restrictedness

### ** Examples

data("aravo", package = "ade4")
# Site-species matrix
mat = as.matrix(aravo$spe)
ri = restrictedness(mat)
head(ri)




