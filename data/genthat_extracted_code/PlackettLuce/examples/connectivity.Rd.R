library(PlackettLuce)


### Name: connectivity
### Title: Check Connectivity of Rankings
### Aliases: connectivity

### ** Examples

## weakly connected network:
## one win between two clusters
X <- matrix(c(1, 2, 0, 0,
              2, 1, 3, 0,
              0, 0, 1, 2,
              0, 0, 2, 1), ncol = 4, byrow = TRUE)
X <- as.rankings(X)
res <- connectivity(X)
res$membership
## keep items in cluster 1
X[,res$membership == 1]

## two weakly connected items:
## item 1 always loses; item 4 only wins against item 1
X <- matrix(c(4, 1, 2, 3,
              0, 2, 1, 3), nr = 2, byrow = TRUE)
X <- as.rankings(X)
res <- connectivity(X)
res$membership

## item 1 always wins; item 4 always loses
X <- matrix(c(1, 2, 3, 4,
              1, 3, 2, 4), nr = 2, byrow = TRUE)
res <- connectivity(as.rankings(X))
res$membership

## all in separate clusters: always 1 > 2 > 3 > 4
## also miscoded rankings and redundant ranking
X <- matrix(c(1, 2, 3, 4,
              1, 0, 2, 3,
              1, 1, 2, 0,
              1, 0, 3, 4,
              2, 2, 0, 4,
              0, 0, 3, 0,
              2, 4, 0, 0), ncol = 4, byrow = TRUE)
res <- connectivity(as.rankings(X))
res$membership




