library(glmmML)


### Name: glmmML
### Title: Generalized Linear Models with random intercept
### Aliases: glmmML
### Keywords: regression

### ** Examples

id <- factor(rep(1:20, rep(5, 20)))
y <- rbinom(100, prob = rep(runif(20), rep(5, 20)), size = 1)
x <- rnorm(100)
dat <- data.frame(y = y, x = x, id = id)
glmmML(y ~ x, data = dat, cluster = id)



