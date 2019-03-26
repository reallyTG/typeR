library(ROptRegTS)


### Name: Av2CondContNeighborhood
### Title: Generating function for Av2CondContNeighborhood-class
### Aliases: Av2CondContNeighborhood
### Keywords: models robust

### ** Examples

Av2CondContNeighborhood()

## The function is currently defined as
function(radius = 0, radiusCurve = function(x){1}){ 
    new("Av2CondContNeighborhood", radius = radius, radiusCurve = radiusCurve) 
}



