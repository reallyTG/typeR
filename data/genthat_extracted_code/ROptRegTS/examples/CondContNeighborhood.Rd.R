library(ROptRegTS)


### Name: CondContNeighborhood
### Title: Generating function for CondContNeighborhood-class
### Aliases: CondContNeighborhood
### Keywords: models robust

### ** Examples

CondContNeighborhood()

## The function is currently defined as
function(radius = 0, radiusCurve = function(x){1}){ 
    new("CondContNeighborhood", radius = radius, radiusCurve = radiusCurve) 
}



