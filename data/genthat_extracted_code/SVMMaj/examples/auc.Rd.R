library(SVMMaj)


### Name: auc
### Title: Returns the area under the curve value
### Aliases: auc

### ** Examples

df   <- with(diabetes, cbind(y, X))
lm.y <- glm(y ~ ., data = df, family = binomial())
print(with(lm.y, auc(fitted.values, y)))




