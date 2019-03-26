library(hypercube)


### Name: add.selection
### Title: Adds selection criteria to a hypercube
### Aliases: add.selection

### ** Examples


data("sales")
print(str(sales))
cube = generateCube(sales, columns = list(time = c("month", "year"),
      location = c("state"), product = "product"), valueColumn = "amount")
cube = add.selection(cube, criteria = list(state = c("CA", "FL")))
cube
cube = add.selection(cube, criteria = list(state = c("TX")))
cube




