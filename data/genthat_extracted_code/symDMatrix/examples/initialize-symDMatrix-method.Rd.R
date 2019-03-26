library(symDMatrix)


### Name: initialize,symDMatrix-method
### Title: Create a New symDMatrix Instance.
### Aliases: initialize,symDMatrix-method

### ** Examples

# Generate a symmetric matrix
X <- cov(matrix(data = rnorm(25), nrow = 5, ncol = 5))

# Break this matrix into blocks X11, X12, X22
# X21 can be stored as a virtual transpose of X12
X11 <- ff::as.ff(X[1:3, 1:3])
X12 <- ff::as.ff(X[1:3, 4:5])
X22 <- ff::as.ff(X[4:5, 4:5])
X21 <- ff::vt(X12)

# Create a symDMatrix from blocks
S <- symDMatrix(
    LinkedMatrix::ColumnLinkedMatrix(X11, X12),
    LinkedMatrix::ColumnLinkedMatrix(X21, X22)
)
nBlocks(S)
blockSize(S)
blockSize(S, last = TRUE)



