library(LambertW)


### Name: test_normality
### Title: Visual and statistical Gaussianity check
### Aliases: test_norm test_normality
### Keywords: hplot htest

### ** Examples


y <- rLambertW(n = 1000, theta = list(beta = c(3, 4), gamma = 0.3),
               distname = "normal")
test_normality(y)

x <- rnorm(n = 1000)
test_normality(x)

# mixture of exponential and normal
test_normality(c(rexp(100), rnorm(100, mean = -5)))




