library(cdcsis)


### Name: cdcov.test
### Title: Conditional Distance Covariance Independence Test
### Aliases: cdcov.test

### ** Examples

library(cdcsis)
set.seed(1)
num <- 50
################# Conditional Independent #################
## Case 1:
cov_mat <- matrix(c(1, 0.36, 0.6, 0.36, 1, 0.6, 0.6, 0.6, 1), nrow = 3)
dat <- mvtnorm::rmvnorm(n = num, sigma = cov_mat)
x <- dat[, 1]
y <- dat[, 2]
z <- dat[, 3]
cdcov.test(x, y, z)
## Case 2:
z <- rnorm(num)
x <- 0.5 * (z^3 / 7 + z / 2) + tanh(rnorm(num))
x <- x + x^3 / 3
y <- (z^3 + z) / 3 + rnorm(num)
y <- y + tanh(y / 3)
cdcov.test(x, y, z, num.bootstrap = 99)

################# Conditional Dependent #################
## Case 3:
cov_mat <- matrix(c(1, 0.7, 0.6, 0.7, 1, 0.6, 0.6, 0.6, 1), nrow = 3)
dat <- mvtnorm::rmvnorm(n = num, sigma = cov_mat)
x <- dat[, 1]
y <- dat[, 2]
z <- dat[, 3]
cdcov.test(x, y, z, width = 0.5)
## Case 4:
z <- matrix(rt(num * 4, df = 2), nrow = num)
x <- z
y <- cbind(sin(z[, 1]) + cos(z[, 2]) + (z[, 3])^2 + (z[, 4])^2, 
           (z[, 1])^2 + (z[, 2])^2 + z[, 3] + z[, 4])
z <- z[, 1:2]
cdcov.test(x, y, z, seed = 2)

################# Distance Matrix Input #################
x <- dist(x)
y <- dist(y)
cdcov.test(x, y, z, seed = 2, distance = TRUE)



