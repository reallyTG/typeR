library(aurelius)


### Name: extract_params.cv.glmnet
### Title: extract_params.cv.glmnet
### Aliases: extract_params.cv.glmnet

### ** Examples

X <- matrix(c(rnorm(100), runif(100)), nrow=100, ncol=2)
Y <- factor(3 - 5 * X[,1] + 3 * X[,2] + rnorm(100, 0, 3) > 0)

model <- glmnet::cv.glmnet(X, Y, family = 'binomial')
my_model_params <- extract_params(model)



