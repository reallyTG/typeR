library(matlib)


### Name: gsorth
### Title: Gram-Schmidt Orthogonalization of a Matrix
### Aliases: gsorth

### ** Examples

## Not run: 
##D  set.seed(1234)
##D  A <- matrix(c(1:60 + rnorm(60)), 20, 3)
##D  cor(A)
##D  G <- gsorth(A)
##D  zapsmall(cor(G))
##D  
## End(Not run)



