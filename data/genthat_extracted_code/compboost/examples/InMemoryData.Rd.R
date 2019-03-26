library(compboost)


### Name: InMemoryData
### Title: In memory data class to store data in RAM
### Aliases: InMemoryData

### ** Examples

# Sample data:
data.mat = cbind(1:10)

# Create new data object:
data.obj = InMemoryData$new(data.mat, "my.data.name")

# Get data and identifier:
data.obj$getData()
data.obj$getIdentifier()




