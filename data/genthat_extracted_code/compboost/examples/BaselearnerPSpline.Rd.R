library(compboost)


### Name: BaselearnerPSpline
### Title: Base-learner factory to do non-parametric B or P-spline
###   regression
### Aliases: BaselearnerPSpline

### ** Examples

# Sample data:
data.mat = cbind(1:10)
y = sin(1:10)

# Create new data object:
data.source = InMemoryData$new(data.mat, "my.data.name")
data.target = InMemoryData$new()

# Create new linear base-learner:
spline.factory = BaselearnerPSpline$new(data.source, data.target,
  degree = 3, n_knots = 4, penalty = 2, differences = 2)

# Get the transformed data:
spline.factory$getData()

# Summarize factory:
spline.factory$summarizeFactory()

# Transform data manually:
spline.factory$transformData(data.mat)




