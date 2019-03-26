library(disclap)


### Name: Discrete Laplace exponential family
### Title: Discrete Laplace exponential family
### Aliases: DiscreteLaplace

### ** Examples

xs <- abs(rdisclap(100, 0.1))
fit <- glm(xs ~ 1, family = DiscreteLaplace())
summary(fit)
theta <- as.numeric(coef(fit)[1])
mu <- DiscreteLaplace()$linkinv(theta)
p <- (sqrt(1 + mu^2) - 1) / mu
p



