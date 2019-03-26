library(robust)


### Name: predict.lmRob
### Title: Use predict() on an lmRob Object
### Aliases: predict.lmRob
### Keywords: robust regression methods

### ** Examples

data(stack.dat)
stack.rob <- lmRob(Loss ~ ., data = stack.dat)
predict(stack.rob)
predict(stack.rob, newdata = stack.dat[c(1,2,4,21), ], se.fit = TRUE)



