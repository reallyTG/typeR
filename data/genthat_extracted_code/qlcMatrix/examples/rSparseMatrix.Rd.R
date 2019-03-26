library(qlcMatrix)


### Name: rSparseMatrix
### Title: Construct a random sparse matrix
### Aliases: rSparseMatrix

### ** Examples

# example with reasonably large (100.000 by 100.000) but sparse matrix
# (only one in 10.000 entries is non-zero). On average 10 entries per column.
X <- rSparseMatrix(1e5, 1e5, 1e6)
print(object.size(X), units = "auto")

# speed of cosine similarity
system.time(M <- cosSparse(X))

# reduce memory footprint by removing low values
print(object.size(M), units = "auto")
M <- drop0(M, tol = 0.1)
print(object.size(M), units = "auto")



