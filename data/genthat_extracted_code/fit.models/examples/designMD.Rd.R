library(fit.models)


### Name: designMD
### Title: Design Matrix Mahalanobis Distance
### Aliases: designMD designMD.default
### Keywords: methods regression

### ** Examples

stack.lm <- lm(stack.loss ~ ., data = stackloss)

# Mahalanobis distance (not squared)
sqrt(designMD(stack.lm))



