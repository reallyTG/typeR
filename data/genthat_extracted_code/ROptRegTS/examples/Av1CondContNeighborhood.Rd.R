library(ROptRegTS)


### Name: Av1CondContNeighborhood
### Title: Generating function for Av1CondContNeighborhood-class
### Aliases: Av1CondContNeighborhood
### Keywords: models robust

### ** Examples

Av1CondContNeighborhood()

## The function is currently defined as
function(radius = 0, radiusCurve = function(x){1}){ 
    new("Av1CondContNeighborhood", radius = radius, radiusCurve = radiusCurve) 
}



