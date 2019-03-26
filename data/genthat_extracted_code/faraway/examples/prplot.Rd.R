library(faraway)


### Name: prplot
### Title: Partial Residual Plot
### Aliases: prplot
### Keywords: regression

### ** Examples

data(stackloss)
g <- lm(stack.loss ~ .,stackloss)
prplot(g,1)



