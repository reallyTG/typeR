library(psycho)


### Name: simulate_data_regression
### Title: Simulates data for single or multiple regression.
### Aliases: simulate_data_regression

### ** Examples

library(psycho)

data <- simulate_data_regression(coefs = c(0.1, 0.8), sample = 50, error = 0)
fit <- lm(y ~ ., data = data)
coef(fit)
analyze(fit)



