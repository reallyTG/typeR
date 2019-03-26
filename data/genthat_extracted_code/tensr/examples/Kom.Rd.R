library(tensr)


### Name: Kom
### Title: Commutation matrix.
### Aliases: Kom

### ** Examples

m <- 5 ; n <- 4
A <- matrix(stats::rnorm(m * n), m, n)
Kom(5, 4) %*% c(A) - c(t(A))



