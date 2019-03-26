library(mcglm)


### Name: mc_sic
### Title: Score Information Criterion - Regression
### Aliases: mc_sic

### ** Examples

set.seed(123)
x1 <- runif(100, -1, 1)
x2 <- gl(2,50)
beta = c(5, 0, 3)
X <- model.matrix(~ x1 + x2)
y <- rnorm(100, mean = X%*%beta , sd = 1)
data <- data.frame(y, x1, x2)
# Reference model
fit0 <- mcglm(c(y ~ 1), list(mc_id(data)), data = data)
# Computing SIC
mc_sic(fit0, scope = c("x1","x2"), data = data, response = 1)




