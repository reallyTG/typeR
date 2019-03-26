library(sFFLHD)


### Name: split_matrix
### Title: Split a matrix by rows, based on either the number of rows per
###   group or number of splits.
### Aliases: split_matrix

### ** Examples

mat <- matrix(1:12, ncol=2)
split_matrix(mat, 4, shuffle=FALSE)
split_matrix(mat, 4, shuffle=TRUE)
split_matrix(mat, nsplits=3, shuffle=FALSE) # same as 4 rowspergroup



