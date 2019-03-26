library(CompGLM)


### Name: glm.comp
### Title: Conway-Maxwell Poisson GLM Fitting Function
### Aliases: glm.comp

### ** Examples

set.seed(1)
n <- 5000
x1 <- rnorm(n, -1.0, 0.5)
x2 <- rnorm(n, 1.0, 0.7)
x3 <- rnorm(n, 2.0, 0.4)
y <- rpois(n, exp(-0.5 + 0.3 * x1 + 0.8 * x2 + 0.2 * x3))
data <- data.frame(y, x1, x2, x3)
model <- glm.comp(y ~ ., data = data)
print(model)
summary(model)
coef(model)
head(predict(model))
AIC(model)



