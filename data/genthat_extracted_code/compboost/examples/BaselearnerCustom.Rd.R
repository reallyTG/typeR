library(compboost)


### Name: BaselearnerCustom
### Title: Create custom base-learner factory by using R functions.
### Aliases: BaselearnerCustom

### ** Examples

# Sample data:
data.mat = cbind(1, 1:10)
y = 2 + 3 * 1:10

# Create new data object:
data.source = InMemoryData$new(data.mat, "my.data.name")
data.target = InMemoryData$new()

instantiateDataFun = function (X) {
  return(X)
}
# Ordinary least squares estimator:
trainFun = function (y, X) {
  return(solve(t(X) %*% X) %*% t(X) %*% y)
}
predictFun = function (model, newdata) {
  return(as.matrix(newdata %*% model))
}
extractParameter = function (model) {
  return(as.matrix(model))
}

# Create new custom linear base-learner factory:
custom.lin.factory = BaselearnerCustom$new(data.source, data.target,
  instantiateDataFun, trainFun, predictFun, extractParameter)

# Get the transformed data:
custom.lin.factory$getData()

# Summarize factory:
custom.lin.factory$summarizeFactory()

# Transform data manually:
custom.lin.factory$transformData(data.mat)




