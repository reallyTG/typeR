library(ROptRegTS)


### Name: FixRobRegTypeModel
### Title: Generating function for FixRobRegTypeModel-class
### Aliases: FixRobRegTypeModel
### Keywords: models robust

### ** Examples

FixRobRegTypeModel()

## The function is currently defined as
function(center = RegTypeFamily(), neighbor = ContNeighborhood()){
    new("FixRobRegTypeModel", center = center, neighbor = neighbor)
}



