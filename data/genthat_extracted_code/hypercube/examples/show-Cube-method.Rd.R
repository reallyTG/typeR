library(hypercube)


### Name: show,Cube-method
### Title: Shows a 'Cube' object
### Aliases: show,Cube-method

### ** Examples


data("sales")
cube = generateCube(sales, columns = list(time = c("month", "year"),
      location = c("state"), product = "product"), valueColumn = "amount")
cube




