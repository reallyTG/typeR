library(dvmisc)


### Name: get_mse
### Title: Extract Mean Squared Error (MSE) from Fitted Regression Model
### Aliases: get_mse

### ** Examples

# Generate 100 values: Y = 0.5 + 1.25 X + e, e ~ N(0, 1)
set.seed(123)
x <- rnorm(100)
y <- 0.5 + 1.25 * x + rnorm(100, sd = 1)

# Fit regression model using lm and using glm
lm.fit <- lm(y ~ x)
glm.fit <- glm(y ~ x)

# Extract MSE from lm.fit and glm.fit
get_mse(lm.fit)
get_mse(glm.fit)




