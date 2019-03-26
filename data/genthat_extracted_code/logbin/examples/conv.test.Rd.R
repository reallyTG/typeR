library(logbin)


### Name: conv.test
### Title: Convergence Test Based on L2 Norm
### Aliases: conv.test
### Keywords: models misc

### ** Examples

theta.old <- c(-4,-5,-6)
theta.new <- c(-4.05,-5,-6)

conv.test(theta.old, theta.new, 0.01)
conv.test(theta.old, theta.new, 0.005)



