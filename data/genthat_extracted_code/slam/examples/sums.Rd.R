library(slam)


### Name: sums
### Title: Form Row and Column Sums and Means
### Aliases: row_sums row_sums.simple_triplet_matrix col_sums
###   col_sums.simple_triplet_matrix row_means
###   row_means.simple_triplet_matrix col_means
###   col_means.simple_triplet_matrix
### Keywords: array algebra arith

### ** Examples

##
x <- matrix(c(1, 0, 0, 2, 1, NA), nrow = 3)
x
s <- as.simple_triplet_matrix(x)
row_sums(s)
row_sums(s, na.rm = TRUE)
col_sums(s)
col_sums(s, na.rm = TRUE)



