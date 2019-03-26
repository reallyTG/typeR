library(robust)


### Name: lmRob.RFPE
### Title: Robust Final Prediction Errors
### Aliases: lmRob.RFPE
### Keywords: robust regression

### ** Examples

data(stack.dat)
stack.rob <- lmRob(Loss ~ ., data = stack.dat)
lmRob.RFPE(stack.rob)



