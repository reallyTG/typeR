library(MachineShop)


### Name: POLRModel
### Title: Ordered Logistic or Probit Regression Model
### Aliases: POLRModel

### ** Examples

library(MASS)

df <- Boston
df$medv <- cut(Boston$medv, breaks = c(0, 15, 20, 25, 50), ordered = TRUE)   
fit(medv ~ ., data = df, model = POLRModel())




