library(oppr)


### Name: parameters
### Title: Parameters
### Aliases: parameters

### ** Examples

# create two Parameter objects
p1 <- binary_parameter("parameter one", 1)
print(p1)

p2 <- numeric_parameter("parameter two", 5)
print(p2)

# store Parameter objects in a Parameters object
p <- parameters(p1, p2)
print(p)




