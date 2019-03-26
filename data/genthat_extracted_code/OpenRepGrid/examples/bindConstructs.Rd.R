library(OpenRepGrid)


### Name: bindConstructs
### Title: Concatenate the constructs of two or more grids.
### Aliases: bindConstructs

### ** Examples


 a <- randomGrid()
 b <- randomGrid()
 b@elements <- rev(a@elements)   # reverse elements
 bindConstructs(a, b)
 bindConstructs(a, b, a)
 
 # using lists of repgrid objects 
 bindConstructs(a, list(a, b))




