library(igraph)


### Name: arpack_defaults
### Title: ARPACK eigenvector calculation
### Aliases: arpack_defaults arpack arpack-options igraph.arpack.default
###   arpack.unpack.complex arpack_defaults
### Keywords: datasets graphs

### ** Examples


# Identity matrix
f <- function(x, extra=NULL) x
arpack(f, options=list(n=10, nev=2, ncv=4), sym=TRUE)

# Graph laplacian of a star graph (undirected), n>=2
# Note that this is a linear operation
f <- function(x, extra=NULL) {
  y <- x
  y[1] <- (length(x)-1)*x[1] - sum(x[-1])
  for (i in 2:length(x)) {
    y[i] <- x[i] - x[1]
  }
  y
}

arpack(f, options=list(n=10, nev=1, ncv=3), sym=TRUE)

# double check
eigen(laplacian_matrix(make_star(10, mode="undirected")))

## First three eigenvalues of the adjacency matrix of a graph
## We need the 'Matrix' package for this
if (require(Matrix)) {
  set.seed(42)
  g <- sample_gnp(1000, 5/1000)
  M <- as_adj(g, sparse=TRUE)
  f2 <- function(x, extra=NULL) { cat("."); as.vector(M %*% x) }
  baev <- arpack(f2, sym=TRUE, options=list(n=vcount(g), nev=3, ncv=8,
                                  which="LM", maxiter=2000))
}



