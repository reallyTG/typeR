library(robust)


### Name: lmRob.control
### Title: Control Parameters for Robust Linear Regression
### Aliases: lmRob.control
### Keywords: robust regression

### ** Examples

data(stack.dat)
my.control <- lmRob.control(weight=c("Bisquare","Optimal"))
stack.bo <- lmRob(Loss ~ ., data = stack.dat, control = my.control)



