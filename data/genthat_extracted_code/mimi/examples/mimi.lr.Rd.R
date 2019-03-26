library(mimi)


### Name: mimi.lr
### Title: mimi.lr Compute solution of mimi for low-rank model along
###   regularization path
### Aliases: mimi.lr

### ** Examples

y0 <- matrix(rnorm(6 * 10), nrow = 6)
y0[sample(1:50, size = 10)] <- NA
var.type <- rep("gaussian", 10)
res <- mimi.lr(y0, var.type, lambda1 = 0.1)



