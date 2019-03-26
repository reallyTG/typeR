library(aurelius)


### Name: extract_params.glmnet
### Title: extract_params.glmnet
### Aliases: extract_params.glmnet

### ** Examples

X <- matrix(c(rnorm(100), runif(100)), nrow=100, ncol=2)
Y <- factor(3 - 5 * X[,1] + 3 * X[,2] + rnorm(100, 0, 3) > 0)

model <- glmnet::glmnet(X, Y, family = 'binomial')
my_model_params <- extract_params(model)



