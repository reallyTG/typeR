library(fungible)


### Name: cosMat
### Title: Compute the cosine(s) between either 2 matrices or 2 vectors.
### Aliases: cosMat

### ** Examples

## Cosine between two vectors
A <- rnorm(5)
B <- rnorm(5)

cosMat(A, B)

## Cosine between the columns of two matrices
A <- matrix(rnorm(5 * 5), 5, 5)
B <- matrix(rnorm(5 * 5), 5, 5)

cosMat(A, B)




