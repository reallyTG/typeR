library(dslice)


### Name: ds_eqp_1
### Title: Non-parametric one-sample hypothesis testing via dynamic slicing
### Aliases: ds_eqp_1

### ** Examples

n <- 100
mu <- 0.5
x <- rnorm(n, mu, 1)
y <- pnorm(sort(x), 0, 1) 
lambda <- 1.0
dsres <- ds_eqp_1(y, lambda)



