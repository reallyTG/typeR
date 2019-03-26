library(cmna)


### Name: rowops
### Title: Elementary row operations
### Aliases: rowops swaprows replacerow scalerow

### ** Examples

n <- 5
A <- matrix(sample.int(10, n^2, TRUE) - 1, n)
A <- swaprows(A, 2, 4)
A <- replacerow(A, 1, 3, 2)
A <- scalerow(A, 5, 10)



