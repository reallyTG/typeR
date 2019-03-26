library(robust)


### Name: lsRobTest
### Title: Bias Test for Least-Squares Regression Estimates
### Aliases: lsRobTest
### Keywords: robust regression

### ** Examples

rob.fit <- lmRob(stack.loss ~ ., data = stackloss)
lsRobTest(rob.fit)
lsRobTest(rob.fit, test = "T1")



