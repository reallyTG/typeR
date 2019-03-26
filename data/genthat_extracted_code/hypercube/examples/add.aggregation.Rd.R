library(hypercube)


### Name: add.aggregation
### Title: Adds an aggregation to a hypercube
### Aliases: add.aggregation

### ** Examples


data("sales")
cube = generateCube(sales, columns = list(time = c("month", "year"),
      location = c("state"), product = "product"), valueColumn = "amount")
cube = add.aggregation(cube, dimensions = c("month", "year"), fun = "sum")
cube




