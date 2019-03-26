library(NMOF)


### Name: colSubset
### Title: Full-rank Column Subset
### Aliases: colSubset

### ** Examples

nc <- 3   ## columns
nr <- 10  ## rows
M <- array(rnorm(nr * nc), dim = c(nr, nc))

C <- array(0.5, dim = c(nc, nc))
diag(C) <- 1
M <- M %*% chol(C)
M <- M[ ,c(1,1,1,2,3)]
M

(tmp <- colSubset(M))

C <- cor(M[ ,tmp$columns])
nc <- ncol(C)
nr <- 100
X <- array(rnorm(nr*nc), dim = c(nr, nc))
X <- X %*% chol(C)
X <- X %*% tmp$multiplier
head(X)
cor(X)



