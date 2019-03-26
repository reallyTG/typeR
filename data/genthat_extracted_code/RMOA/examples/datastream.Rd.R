library(RMOA)


### Name: datastream
### Title: Datastream objects and methods
### Aliases: datastream

### ** Examples

## Basic example, showing the general methods available for a datastream object
x <- datastream(description = "My own datastream", args = list(a = "TEST"))
x
str(x)
try(x$get_points(x))



