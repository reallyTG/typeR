library(robust)


### Name: summary.lmRob
### Title: Summarizing Robust Linear Model Fits
### Aliases: summary.lmRob
### Keywords: methods robust regression

### ** Examples

data(stack.dat)
stack.rob <- lmRob(Loss ~ ., data = stack.dat) 
stack.sum <- summary(stack.rob)
stack.sum
stack.bse <- summary(stack.rob, bootstrap.se = TRUE)
stack.bse



