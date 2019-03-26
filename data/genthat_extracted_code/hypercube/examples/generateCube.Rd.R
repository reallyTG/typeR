library(hypercube)


### Name: generateCube
### Title: Generates a hypercube from a given dataframe
### Aliases: generateCube

### ** Examples


data("sales")
cube = generateCube(sales, columns = list(time = c("month", "year"),
      location = c("state"), product = "product"), valueColumn = "amount")




