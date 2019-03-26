library(pmpp)


### Name: pmpp_data
### Title: Transform a single variable in the matrix format into the long
###   panel format
### Aliases: pmpp_data

### ** Examples

set.seed(1)
matrix_var <- matrix(rnorm(100), nrow = 20)
panel_var <- pmpp_data(matrix_var)



