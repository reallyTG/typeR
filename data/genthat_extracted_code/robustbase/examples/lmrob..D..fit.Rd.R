library(robustbase)


### Name: lmrob..D..fit
### Title: Compute Design Adaptive Scale estimate
### Aliases: lmrob..D..fit
### Keywords: robust regression

### ** Examples

data(stackloss)
## Compute manual SMD-estimate:
## 1) MM-estimate
m1 <- lmrob(stack.loss ~ ., data = stackloss)
## 2) Add Design Adaptive Scale estimate
m2 <- lmrob..D..fit(m1)
print(c(m1$scale, m2$scale))

summary(m1)
summary(m2) ## the covariance matrix estimate is also updated



