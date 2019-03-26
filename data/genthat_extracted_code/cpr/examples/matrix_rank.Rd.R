library(cpr)


### Name: matrix_rank
### Title: Rank of a Matrix
### Aliases: matrix_rank

### ** Examples

# Check the rank of a matrix
mat <- matrix(rnorm(25000 * 120), nrow = 25000)
Matrix::rankMatrix(mat)[1]
matrix_rank(mat)

# A full rank B-spline basis
bmat <- bsplines(seq(0, 1, length = 100), df = 15)
matrix_rank(bmat)

# A rank deficient B-spline basis
bmat <- bsplines(seq(0, 1, length = 100), iknots = c(0.001, 0.002))
ncol(bmat)
matrix_rank(bmat)




