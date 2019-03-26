library(robust)


### Name: plot.lmRob
### Title: Diagnostic Regression Plots
### Aliases: plot.lmRob
### Keywords: methods hplot

### ** Examples

data(stack.dat)
stack.rob <- lmRob(Loss ~ ., data = stack.dat)
plot(stack.rob, which.plots = 6)



