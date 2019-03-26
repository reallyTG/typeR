library(hypercube)


### Name: as.data.frame.Cube
### Title: Converts the actual view of a cube to a data frame
### Aliases: as.data.frame.Cube

### ** Examples


data("sales")
cube = generateCube(sales, columns = list(time = c("month", "year"),
      location = c("state"), product = "product"), valueColumn = "amount")
cube = changeDimensionOrder(cube, dimensions = c("product", "month", "year", "state"))
df = as.data.frame(cube)
df




