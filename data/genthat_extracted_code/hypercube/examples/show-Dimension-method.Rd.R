library(hypercube)


### Name: show,Dimension-method
### Title: Shows a 'Dimension' object
### Aliases: show,Dimension-method

### ** Examples


data("sales")
cube = generateCube(sales, columns = list(time = c("month", "year"),
      location = c("state"), product = "product"), valueColumn = "amount")
cube@view[[1]]




