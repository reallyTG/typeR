library(ROptRegTS)


### Name: Av1CondTotalVarNeighborhood
### Title: Generating function for Av1CondTotalVarNeighborhood-class
### Aliases: Av1CondTotalVarNeighborhood
### Keywords: models robust

### ** Examples

Av1CondTotalVarNeighborhood()

## The function is currently defined as
function(radius = 0, radiusCurve = function(x){1}){ 
    new("Av1CondTotalVarNeighborhood", radius = radius, radiusCurve = radiusCurve) 
}



