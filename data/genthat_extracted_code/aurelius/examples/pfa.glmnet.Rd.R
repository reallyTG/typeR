library(aurelius)


### Name: pfa.glmnet
### Title: PFA Formatting of Fitted glmnet objects
### Aliases: pfa.glmnet

### ** Examples

X <- matrix(c(rnorm(100), runif(100)), nrow=100, ncol=2)
Y <- factor(3 - 5 * X[,1] + 3 * X[,2] + rnorm(100, 0, 3) > 0)

model <- glmnet::glmnet(X, Y, family = 'binomial')
model_as_pfa <- pfa(model)



