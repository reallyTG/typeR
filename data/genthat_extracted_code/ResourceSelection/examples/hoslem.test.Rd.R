library(ResourceSelection)


### Name: hoslem.test
### Title: Hosmer-Lemeshow Goodness of Fit (GOF) Test
### Aliases: hoslem.test
### Keywords: htest

### ** Examples

set.seed(123)
n <- 500
x <- rnorm(n)
y <- rbinom(n, 1, plogis(0.1 + 0.5*x))
m <- glm(y ~ x, family=binomial)
hoslem.test(m$y, fitted(m))



