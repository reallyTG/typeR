library(glmmML)


### Name: glmmML.fit
### Title: Generalized Linear Model with random intercept
### Aliases: glmmML.fit
### Keywords: regression

### ** Examples

x <- cbind(rep(1, 14), rnorm(14))
y <- rbinom(14, prob = 0.5, size = 1)
id <- rep(1:7, 2)

glmmML.fit(x, y, cluster = id)





