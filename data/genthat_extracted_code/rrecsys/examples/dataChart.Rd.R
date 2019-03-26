library(rrecsys)


### Name: dataChart
### Title: Visualization of data characteristics.
### Aliases: dataChart

### ** Examples

data(mlLatest100k)

a <- defineData(mlLatest100k)

dataChart(a, x = "items", y = "num_of_ratings")




