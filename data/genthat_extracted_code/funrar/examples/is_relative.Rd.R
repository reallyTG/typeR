library(funrar)


### Name: is_relative
### Title: Tell if matrix or data.frame has relative abundances
### Aliases: is_relative

### ** Examples

data("aravo", package = "ade4")

# Site-species matrix
mat = as.matrix(aravo$spe)
head(mat)[, 1:5]  # Has absolute abundances
rel_mat = make_relative(mat)
head(rel_mat)  # Relative abundances

# Forced to use ':::' becasue function is not exported
funrar:::is_relative(mat)      # FALSE
funrar:::is_relative(rel_mat)  # TRUE




