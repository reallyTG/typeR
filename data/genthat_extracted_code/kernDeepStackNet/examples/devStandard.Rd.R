library(kernDeepStackNet)


### Name: devStandard
### Title: Predictive deviance of a linear model
### Aliases: devStandard
### Keywords: models & regression

### ** Examples

##################
# Fit Gaussian glm

set.seed(10)
x <- matrix(rnorm(100*20),100,20)
set.seed(100)
y <- rnorm(100)
fit1 <- glm(formula=y ~ ., data=data.frame(x))
preds <- predict(fit1, type="response")
# Performance on training data
all.equal(devStandard(preds=preds, ytest=y, RMSE=FALSE), fit1$deviance)
# Performance on random test data
set.seed(100)
yTest <- simulate(fit1)
devStandard(preds=preds, ytest=yTest)



