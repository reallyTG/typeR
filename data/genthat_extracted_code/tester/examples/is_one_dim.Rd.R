library(tester)


### Name: is_one_dim
### Title: Test if an object has one-dimension
### Aliases: is_one_dim

### ** Examples

# vector
is_one_dim(1:5)  # TRUE

# factor
is_one_dim(iris$Species)  # TRUE

# one row matrix
is_one_dim(matrix(1:5, 1, 5))  # TRUE

# one column matrix
is_one_dim(matrix(1:5, 5, 1))  # TRUE

# general matrix (nrow>1, ncol>1)
is_one_dim(matrix(1:9, 3, 3))  # FALSE

# general data frame
is_one_dim(iris)  # FALSE



