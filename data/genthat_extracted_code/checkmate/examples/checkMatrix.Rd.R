library(checkmate)


### Name: checkMatrix
### Title: Check if an argument is a matrix
### Aliases: checkMatrix check_matrix assertMatrix assert_matrix testMatrix
###   test_matrix expect_matrix

### ** Examples

x = matrix(1:9, 3)
colnames(x) = letters[1:3]
testMatrix(x, nrows = 3, min.cols = 1, col.names = "named")



