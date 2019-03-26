library(Rwave)


### Name: SVD
### Title: Singular Value Decomposition
### Aliases: SVD
### Keywords: ts

### ** Examples

   hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
     X <- hilbert(6)
     z  = SVD(X)
     z



