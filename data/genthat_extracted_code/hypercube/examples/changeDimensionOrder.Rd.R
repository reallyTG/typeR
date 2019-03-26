library(hypercube)


### Name: changeDimensionOrder
### Title: Changes the order of the dimensions in a given cube
### Aliases: changeDimensionOrder

### ** Examples


data("sales")
cube = generateCube(sales, columns = list(time = c("month", "year"),
      location = c("state"), product = "product"), valueColumn = "amount")
cube = changeDimensionOrder(cube, dimensions = c("product", "month", "year", "state"))
cube




