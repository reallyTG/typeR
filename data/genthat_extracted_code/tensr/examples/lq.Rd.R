library(tensr)


### Name: lq
### Title: LQ decomposition.
### Aliases: lq

### ** Examples

X <- matrix(stats::rnorm(12), nrow = 3)
lq_X <- lq(X)
L <- lq_X$L
Q <- lq_X$Q
L
Q
trim(t(Q) %*% Q)
trim(X - L%*%t(Q))



