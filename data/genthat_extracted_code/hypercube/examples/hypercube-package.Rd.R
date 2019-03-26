library(hypercube)


### Name: hypercube-package
### Title: Provides methods for organizing data in a hypercube
### Aliases: hypercube-package hypercube
### Keywords: data hypercube, hyperdimensional

### ** Examples


# Simple example
data("sales")
cube = generateCube(sales, columns = list(time = c("month", "year"),
      location = c("state"), product = "product"), valueColumn = "amount")
cube

# More sophisticated example
data("sales")
cube = generateCube(sales, columns = list(time = c("month", "year"),
       location = c("state"), product = "product"), valueColumn = "amount")
cube = add.selection(cube, criteria = list(state = c("AL", "TX")))
cube = add.aggregation(cube, dimensions = c("month", "year"), fun = "sum")
cube
df = as.data.frame(cube)
df



