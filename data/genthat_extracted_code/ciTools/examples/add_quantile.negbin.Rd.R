library(ciTools)


### Name: add_quantile.negbin
### Title: Quantiles for the Response of a Negative Binomial Regression
### Aliases: add_quantile.negbin

### ** Examples

x1 <- rnorm(100, mean = 1)
y <- MASS::rnegbin(n = 100, mu = exp(1 + x1), theta = 5)
df <- data.frame(x1 = x1, y = y)
fit <- MASS::glm.nb(y ~ x1, data = df)
add_quantile(df, fit, p = 0.3)




