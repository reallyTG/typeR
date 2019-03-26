library(ROptRegTS)


### Name: InfRobRegTypeModel
### Title: Generating function for InfRobRegTypeModel-class
### Aliases: InfRobRegTypeModel
### Keywords: models robust

### ** Examples

InfRobRegTypeModel()

## The function is currently defined as
function(center = L2RegTypeFamily(), neighbor = ContNeighborhood()) {
    new("InfRobRegTypeModel", center = center, neighbor = neighbor)
}



