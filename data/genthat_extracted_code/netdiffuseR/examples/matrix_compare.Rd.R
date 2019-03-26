library(netdiffuseR)


### Name: matrix_compare
### Title: Non-zero element-wise comparison between two sparse matrices
### Aliases: matrix_compare binary-functions compare_matrix

### ** Examples

# These two should yield the same results -----------------------------------

# Creating two random matrices
set.seed(89)
A <- rgraph_ba(t = 9, m = 4)
B <- rgraph_ba(t = 9, m = 4)
A;B

# Comparing
ans0 <- matrix_compare(A,B, function(a,b) (a+b)/2)

ans1 <- matrix(0, ncol=10, nrow=10)
for (i in 1:10)
  for (j in 1:10)
    ans1[i,j] <- mean(c(A[i,j], B[i,j]))

# Are these equal?
all(ans0[] == ans1[]) # Should yield TRUE

# More elaborated example (speed) -------------------------------------------
## Not run: 
##D 
##D set.seed(123123123)
##D A <- rgraph_ba(t = 5e3, m = 2)
##D B <- rgraph_ba(t = 5e3, m = 2)
##D 
##D Am <- as.matrix(A)
##D Bm <- as.matrix(B)
##D 
##D compfun <- function(a,b)
##D   ifelse(a > b, a, b)
##D 
##D microbenchmark::microbenchmark(
##D   diffnet = matrix_compare(A, B, compfun),
##D   R       = matrix(ifelse(Am > Bm, Am, Bm), ncol=ncol(Am)),
##D   times   = 10
##D )
##D # Unit: milliseconds
##D #    expr       min        lq      mean    median        uq      max neval
##D # diffnet  352.7989  355.0193  583.5366  357.7138  364.7604 2493.914    10
##D #       R 1648.9607 1744.6762 2491.2435 1947.4344 2729.1274 6260.011    10
##D 
## End(Not run)



