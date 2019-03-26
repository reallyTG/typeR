library(listarrays)


### Name: modify_along_dim
### Title: Modify an array by mapping over 1 or more dimensions
### Aliases: modify_along_dim modify_along_rows modify_along_cols

### ** Examples

x <- array(1:6, 1:3)
modify_along_dim(x, 3, ~mean(.x))
modify_along_dim(x, 3, ~.x/mean(.x))



