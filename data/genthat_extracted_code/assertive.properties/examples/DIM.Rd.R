library(assertive.properties)


### Name: DIM
### Title: Get the dimensions of an object
### Aliases: DIM

### ** Examples

# For data frames and matrices, DIM is the same as dim.
DIM(sleep) 
# For vectors (and other objects without a dim attribute), DIM is the 
# same as length.
DIM(1:10)
DIM(list(x = 1:10))



