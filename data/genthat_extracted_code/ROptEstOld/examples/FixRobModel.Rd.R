library(ROptEstOld)


### Name: FixRobModel
### Title: Generating function for FixRobModel-class
### Aliases: FixRobModel
### Keywords: models

### ** Examples

(M1 <- FixRobModel())

## The function is currently defined as
function(center = ParamFamily(), neighbor = ContNeighborhood()){
    new("FixRobModel", center = center, neighbor = neighbor)
}



