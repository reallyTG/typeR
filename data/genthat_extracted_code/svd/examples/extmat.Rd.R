library(svd)


### Name: extmat
### Title: External matrices operations.
### Aliases: is.extmat extmat.ncol extmat.nrow extmat ematmul

### ** Examples

## Not run: 
##D library(Matrix)
##D f <- function(v) as.numeric(A %*% v) # Convert Matrix object back to vector
##D tf <- function(v) as.numeric(tA %*% v) # Convert Matrix object back to vector
##D 
##D e <- new.env()
##D assign("A", USCounties, e)
##D assign("tA", t(USCounties), e)
##D environment(f) <- e
##D environment(tf) <- e
##D 
##D m <-extmat(f, tf, nrow(USCounties), ncol(USCounties))
##D system.time(v1 <- propack.svd(m, neig = 10))
##D #   user  system elapsed 
##D #  0.252   0.007   0.259 
##D system.time(v2 <- propack.svd(as.matrix(USCounties), neig = 10))
##D #   user  system elapsed 
##D #  8.563   0.027   8.590 
## End(Not run)

# The largest eigenvalue and the corresponding eigenvector of a Hilbert matrix
h <- outer(1:5000, 1:5000, function(i, j) 1 / (i + j - 1))
v1 <- trlan.eigen(h, neig = 1)
# Same, but using complex numbers
v2 <- ztrlan.eigen(h, neig = 1)
print(c(v1$d, v2$d))



