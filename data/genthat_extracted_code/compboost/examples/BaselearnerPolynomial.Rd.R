library(compboost)


### Name: BaselearnerPolynomial
### Title: Base-learner factory to make polynomial regression
### Aliases: BaselearnerPolynomial

### ** Examples

# Sample data:
data.mat = cbind(1:10)

# Create new data object:
data.source = InMemoryData$new(data.mat, "my.data.name")
data.target1 = InMemoryData$new()
data.target2 = InMemoryData$new()

# Create new linear base-learner factory:
lin.factory = BaselearnerPolynomial$new(data.source, data.target1, 
  degree = 2, intercept = FALSE)
lin.factory.int = BaselearnerPolynomial$new(data.source, data.target2, 
  degree = 2, intercept = TRUE)

# Get the transformed data:
lin.factory$getData()
lin.factory.int$getData()

# Summarize factory:
lin.factory$summarizeFactory()

# Transform data manually:
lin.factory$transformData(data.mat)
lin.factory.int$transformData(data.mat)




