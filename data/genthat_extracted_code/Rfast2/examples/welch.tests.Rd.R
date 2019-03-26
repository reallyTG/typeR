library(Rfast2)


### Name: Many Welch tests
### Title: Many Welch tests.
### Aliases: welch.tests

### ** Examples

y <- rnorm(200)
x <- matrix(rbinom(200 * 50, 2, 0.5), ncol = 50) + 1
a <- welch.tests(y, x)



