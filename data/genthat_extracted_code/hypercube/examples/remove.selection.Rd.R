library(hypercube)


### Name: remove.selection
### Title: Removes selection criteria from a hypercube
### Aliases: remove.selection

### ** Examples


data("sales")
print(str(sales))
cube = generateCube(sales, columns = list(time = c("month", "year"),
      location = c("state"), product = "product"), valueColumn = "amount")
cube = add.selection(cube, criteria = list(state = c("CA", "FL")))
cube
cube = remove.selection(cube, dimensions = c("state"))
cube




