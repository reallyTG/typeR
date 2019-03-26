library(compboost)


### Name: BaselearnerCustomCpp
### Title: Create custom cpp base-learner factory by using cpp functions
###   and external pointer.
### Aliases: BaselearnerCustomCpp

### ** Examples

## No test: 
# Sample data:
data.mat = cbind(1, 1:10)
y = 2 + 3 * 1:10

# Create new data object:
data.source = InMemoryData$new(data.mat, "my.data.name")
data.target = InMemoryData$new()

# Source the external pointer exposed by using XPtr:
Rcpp::sourceCpp(code = getCustomCppExample(silent = TRUE))

# Create new linear base-learner:
custom.cpp.factory = BaselearnerCustomCpp$new(data.source, data.target,
  dataFunSetter(), trainFunSetter(), predictFunSetter())

# Get the transformed data:
custom.cpp.factory$getData()

# Summarize factory:
custom.cpp.factory$summarizeFactory()

# Transform data manually:
custom.cpp.factory$transformData(data.mat)
## End(No test)



