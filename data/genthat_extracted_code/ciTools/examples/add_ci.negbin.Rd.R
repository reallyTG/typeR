library(ciTools)


### Name: add_ci.negbin
### Title: Confidence Intervals for Negative Binomial Linear Model
###   Predictions
### Aliases: add_ci.negbin

### ** Examples

x1 <- rnorm(300, mean = 1)
y <- MASS::rnegbin(n = 300, mu = exp(5 + 0.5 * x1), theta = 2)
df <- data.frame(x1 = x1, y = y)
fit <- MASS::glm.nb(y ~ x1, data = df)
df <- df[sample(100),]
add_ci(df, fit, names = c("lcb", "ucb"))




