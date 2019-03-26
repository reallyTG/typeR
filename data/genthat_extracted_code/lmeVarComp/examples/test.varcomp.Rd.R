library(lmeVarComp)


### Name: test.varcomp
### Title: Testing Zero Variance Components in Linear Mixed Models
### Aliases: test.varcomp

### ** Examples

n1 <- 5L
n2 <- 6L
n0 <- 4L
A <- gl(n1, n2 * n0)
B <- rep(gl(n2, n0), n1)
set.seed(1L)
Y <- 1 + rnorm(n1, 0, 0.7)[A] + rnorm(n2, 0, 0.3)[B] + 
  rnorm(n1 * n2, 0, 0.5)[A : B] + rnorm(n1 * n2 * n0, 0, 1)
test.varcomp(Y ~ 1, ~ -1 + A + B + A:B, test = c(2L, 3L), 
  nsim = 2000L, seed = 2L)



