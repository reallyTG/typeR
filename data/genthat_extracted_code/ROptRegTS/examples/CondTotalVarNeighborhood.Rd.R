library(ROptRegTS)


### Name: CondTotalVarNeighborhood
### Title: Generating function for CondContNeighborhood-class
### Aliases: CondTotalVarNeighborhood
### Keywords: models robust

### ** Examples

CondTotalVarNeighborhood()

## The function is currently defined as
function(radius = 0, radiusCurve = function(x){1}){ 
    new("CondTotalVarNeighborhood", radius = radius, radiusCurve = radiusCurve) 
}



