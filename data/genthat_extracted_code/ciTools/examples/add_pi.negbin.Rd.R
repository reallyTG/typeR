library(ciTools)


### Name: add_pi.negbin
### Title: Prediction Intervals for Negative Binomial Linear Models
### Aliases: add_pi.negbin

### ** Examples

x1 <- rnorm(100, mean = 1)
y <- MASS::rnegbin(n = 100, mu = exp(1 + x1), theta = 5)
df <- data.frame(x1 = x1, y = y)
fit <- MASS::glm.nb(y ~ x1, data = df)
add_pi(df, fit, names = c("lpb", "upb"))




