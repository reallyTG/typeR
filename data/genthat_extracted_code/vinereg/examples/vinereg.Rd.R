library(vinereg)


### Name: vinereg
### Title: D-vine regression models
### Aliases: vinereg

### ** Examples

# simulate data
x <- matrix(rnorm(300), 100, 2)
y <- x %*% c(1, -2)
dat <- data.frame(y = y, x = x, z = as.factor(rbinom(100, 2, 0.5)))

# fit vine regression model
(fit <- vinereg(y ~ ., dat))

# inspect model
summary(fit)
plot_effects(fit)

# model predictions
mu_hat  <- predict(fit, newdata = dat, alpha = NA)          # mean
med_hat <- predict(fit, newdata = dat, alpha = 0.5)         # median

# observed vs predicted
plot(cbind(y, mu_hat))

## fixed variable order (no selection)
(fit <- vinereg(y ~ ., dat, order = c("x.2", "x.1", "z.1")))




