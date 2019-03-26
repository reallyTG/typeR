library(TSDT)


### Name: unpack_args
### Title: unpack_args
### Aliases: unpack_args

### ** Examples

## Create a list of named elements
arglist <- list( one = 1, two = 2, color = "blue" )

## The variables one, two, and color do not exist in the current environment
ls()

## Unpack the elements in arglist
unpack_args( arglist )

## Now the variables one, two, and color do exist in the current environment
ls()
one



