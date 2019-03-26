library(listarrays)


### Name: set_as_rows
### Title: Reshape an array to send a dimension forward or back
### Aliases: set_as_rows set_as_cols

### ** Examples

x <- array(1:24, 2:4)
y <- set_as_rows(x, 3)

for (i in seq_along_dim(x, 3))
  stopifnot( identical(x[,,i], y[i,,]) )



