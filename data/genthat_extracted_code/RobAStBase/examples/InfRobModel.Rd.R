library(RobAStBase)


### Name: InfRobModel
### Title: Generating function for InfRobModel-class
### Aliases: InfRobModel
### Keywords: models

### ** Examples

(M1 <- InfRobModel())

## The function is currently defined as
function(center = L2ParamFamily(), neighbor = ContNeighborhood()){
    new("InfRobModel", center = center, neighbor = neighbor)
}



