library(nima)


### Name: mse
### Title: Mean Squared Error (MSE)
### Aliases: mse

### ** Examples

x <- rnorm(100)
y <- x^2
test_x <- rnorm(100)
test_y <- test_x^2
mod <- glm(y ~ x)
pred <- predict(mod, newx = as.data.frame(test_x))
error <- mse(prediction = pred, outcome = test_y)



