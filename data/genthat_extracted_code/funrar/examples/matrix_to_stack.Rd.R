library(funrar)


### Name: matrix_to_stack
### Title: Matrix to stacked (= tidy) data.frame
### Aliases: matrix_to_stack matrix_to_tidy

### ** Examples

data("aravo", package = "ade4")

# Site-species matrix converted into data.frame
mat = as.matrix(aravo$spe)
dat = matrix_to_stack(mat, "value", "site", "species")
str(dat)




