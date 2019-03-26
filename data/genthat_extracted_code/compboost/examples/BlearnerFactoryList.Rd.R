library(compboost)


### Name: BlearnerFactoryList
### Title: Base-learner factory list to define the set of base-learners
### Aliases: BlearnerFactoryList

### ** Examples

# Sample data:
data.mat = cbind(1:10)

# Create new data object:
data.source = InMemoryData$new(data.mat, "my.data.name")
data.target1 = InMemoryData$new()
data.target2 = InMemoryData$new()

lin.factory = BaselearnerPolynomial$new(data.source, data.target1, 1, TRUE)
poly.factory = BaselearnerPolynomial$new(data.source, data.target2, 2, TRUE)

# Create new base-learner list:
my.bl.list = BlearnerFactoryList$new()

# Register factories:
my.bl.list$registerFactory(lin.factory)
my.bl.list$registerFactory(poly.factory)

# Get registered factories:
my.bl.list$printRegisteredFactories()

# Get all target data matrices in one big matrix:
my.bl.list$getModelFrame()

# Clear list:
my.bl.list$clearRegisteredFactories()

# Get number of registered factories:
my.bl.list$getNumberOfRegisteredFactories()




