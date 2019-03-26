library(hypercube)


### Name: remove.aggregation
### Title: Removes aggregations from a hypercube
### Aliases: remove.aggregation

### ** Examples


data("sales")
cube = generateCube(sales, columns = list(time = c("month", "year"),
      location = c("state"), product = "product"), valueColumn = "amount")
cube = add.aggregation(cube, dimensions = c("month", "year"), fun = "sum")
cube
cube = add.aggregation(cube, dimensions = "year", fun = "sum")
cube
cube = remove.aggregation(cube, dimensions = "year")
cube




