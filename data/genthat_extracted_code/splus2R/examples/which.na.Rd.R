library(splus2R)


### Name: which.na
### Title: Determine Which Values are Missing Values
### Aliases: which.na
### Keywords: utilities

### ** Examples

## A non-zero number divided by zero creates 
## infinity, zero over zero creates a NaN 
weird.values <- c(1/0, -20.9/0, 0/0, NA)

## Produces: 3 4. In this example, the which.na 
## expression and the subscript expression 
## involving is.na should return the same value 
which.na(weird.values)
seq(along=weird.values)[is.na(weird.values)]



