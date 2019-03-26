library(robustbase)


### Name: ltsReg
### Title: Least Trimmed Squares Robust (High Breakdown) Regression
### Aliases: ltsReg ltsReg.default ltsReg.formula print.lts
### Keywords: robust regression

### ** Examples

data(heart)
## Default method works with 'x'-matrix and y-var:
heart.x <- data.matrix(heart[, 1:2]) # the X-variables
heart.y <- heart[,"clength"]
ltsReg(heart.x, heart.y)

data(stackloss)
ltsReg(stack.loss ~ ., data = stackloss)



