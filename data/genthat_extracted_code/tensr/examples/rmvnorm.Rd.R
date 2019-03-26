library(tensr)


### Name: rmvnorm
### Title: Multivariate normal simulation.
### Aliases: rmvnorm
### Keywords: multivariate simulation

### ** Examples

# Simulate several matrices and compute the mean.
Y <- tensr:::rmvnorm(100, c(1, 2, 3), matrix(c(3, 0, 1, 0, 1, -1, 1, -1, 2), 3, 3))
colMeans(Y)
cov(Y)



