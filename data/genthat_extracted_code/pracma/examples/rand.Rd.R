library(pracma)


### Name: rand
### Title: Create Random Matrices
### Aliases: rand randn randi randsample rands randp
### Keywords: stat

### ** Examples

rand(3)
randn(1, 5)
randi(c(1,6), 1, 10)
randsample(10, 5, replacement = TRUE, w = c(0,0,0, 1, 1, 1, 1, 0,0,0))

P <- rands(1000, N = 1, r = 2)
U <- randp(1000, 2)
## Not run: 
##D plot(U[, 1], U[, 2], pch = "+", asp = 1)
##D points(P, pch = ".")
## End(Not run)

#-- v is 2 independent normally distributed elements
# u <- randp(1); r <- t(u) %*% u
# v <- sqrt(-2 * log(r)/r) * u

n <- 5000; U <- randp(n)
R <- apply(U*U, 1, sum)
P <- sqrt(-2 * log(R)/R) * U  # rnorm(2*n)
## Not run: 
##D hist(c(P))
## End(Not run)



