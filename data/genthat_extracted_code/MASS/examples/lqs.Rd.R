library(MASS)


### Name: lqs
### Title: Resistant Regression
### Aliases: lqs lqs.formula lqs.default lmsreg ltsreg
### Keywords: models robust

### ** Examples

set.seed(123) # make reproducible
lqs(stack.loss ~ ., data = stackloss)
lqs(stack.loss ~ ., data = stackloss, method = "S", nsamp = "exact")



