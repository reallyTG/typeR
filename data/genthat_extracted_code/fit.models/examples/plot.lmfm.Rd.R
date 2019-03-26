library(fit.models)


### Name: plot.lmfm
### Title: Comparison Diagnostic Plots for Linear Regression Models
### Aliases: plot.lmfm
### Keywords: hplot methods

### ** Examples

data(stackloss)
stack.lm <- lm(stack.loss ~ ., data = stackloss)
stack.clean <- lm(stack.loss ~ ., data = stackloss, subset = 5:20)
fm <- fit.models(stack.clean, stack.lm)
plot(fm)



