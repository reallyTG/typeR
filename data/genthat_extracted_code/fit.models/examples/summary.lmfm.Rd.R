library(fit.models)


### Name: summary.lmfm
### Title: Comparison Summaries for Linear Regression Models
### Aliases: summary.lmfm
### Keywords: methods regression

### ** Examples


data(stackloss)
m1 <- lm(stack.loss ~ ., data = stackloss)
m2 <- lm(stack.loss ~ . - Acid.Conc., data = stackloss)

fm <- fit.models(m1, m2)
print(fm.sum <- summary(fm))



