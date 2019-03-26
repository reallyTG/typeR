library(cusp)


### Name: cusp.extrema
### Title: Locate Extrema of Cusp Catastrophe Potential Function
### Aliases: cusp.extrema
### Keywords: math utilities

### ** Examples

    # simple use
    cusp.extrema(2,3)
    
    # using vectorize to allow for array input; 
    # returns a matrix with locations in each column
    Vectorize(cusp.extrema)(-3:3, 2)



