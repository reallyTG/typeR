library(rgl)


### Name: GramSchmidt
### Title: The Gram-Schmidt algorithm
### Aliases: GramSchmidt

### ** Examples

# Proceed through the rows in order
print(A <- matrix(rnorm(9), 3, 3))
GramSchmidt(A[1, ], A[2, ], A[3, ])

# Keep the middle row unchanged
print(A <- matrix(c(rnorm(2), 0, 1, 0, 0, rnorm(3)), 3, 3, byrow = TRUE))
GramSchmidt(A[1, ], A[2, ], A[3, ], order = c(2, 1, 3))



