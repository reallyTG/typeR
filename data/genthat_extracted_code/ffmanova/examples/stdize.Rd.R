library(ffmanova)


### Name: stdize
### Title: Centering and scaling of matrices
### Aliases: stdize
### Keywords: array

### ** Examples


A <- matrix(rnorm(15, mean = 1), ncol = 3)
stopifnot(all.equal(stdize(A), scale(A), check.attributes = FALSE))

## These are different:
stdize(A, center = FALSE)
scale(A, center = FALSE)




