library(dslice)


### Name: ds_test
### Title: Hypothesis testing via dynamic slicing
### Aliases: ds_test

### ** Examples

##  One-sample test
n <- 100
mu <- 0.5
y <- rnorm(n, mu, 1)
lambda <- 1.0
alpha <- 1.0
dsres <- ds_test(y, "pnorm", 0, 1, lambda = 1, alpha = 1, rounds = 100)
dsres <- ds_test(y, "pnorm", 0, 1, type = "ds", lambda = 1, alpha = 1)
dsres <- ds_test(y, "pnorm", 0, 1, type = "eqp", lambda = 1, rounds = 100)
dsres <- ds_test(y, "pnorm", 0, 1, type = "eqp", lambda = 1)

##  K-sample test
n <- 100
mu <- 0.5
y <- c(rnorm(n, -mu, 1), rnorm(n, mu, 1))

##  generate x in this way:
x <- c(rep(0, n), rep(1, n))
x <- as.integer(x)

##  or in this way:
x <- c(rep("G1", n), rep("G2", n))
x <- relabel(x)

lambda <- 1.0
dsres <- ds_test(y, x, lambda = 1, rounds = 100)
dsres <- ds_test(y, x, type = "eqp", lambda = 1, rounds = 100)



