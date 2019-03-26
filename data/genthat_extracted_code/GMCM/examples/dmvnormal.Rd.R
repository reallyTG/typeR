library(GMCM)


### Name: dmvnormal
### Title: Multivariate Gaussian density and simulation
### Aliases: dmvnormal rmvnormal

### ** Examples

dmvnormal(x = matrix(rnorm(300), 100, 3),
          mu = 1:3,
          sigma = diag(3))
rmvnormal(n = 10, mu = 1:4, sigma = diag(4))



