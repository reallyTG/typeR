library(vinereg)


### Name: plot_effects
### Title: Plot marginal effects of a D-vine regression model
### Aliases: plot_effects

### ** Examples

# simulate data
x <- matrix(rnorm(300), 100, 2)
y <- x %*% c(1, -2)
dat <- data.frame(y = y, x = x, z = as.factor(rbinom(100, 2, 0.5)))

# fit vine regression model
fit <- vinereg(y ~ ., dat)
plot_effects(fit)



