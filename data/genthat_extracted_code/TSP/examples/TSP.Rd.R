library(TSP)


### Name: TSP
### Title: Class TSP - Symmetric traveling salesperson problem
### Aliases: TSP as.TSP as.TSP.matrix as.TSP.dist n_of_cities
###   n_of_cities.TSP print.TSP labels.TSP image.TSP
### Keywords: classes

### ** Examples

data("iris")
d <- dist(iris[-5])

## create a TSP
tsp <- TSP(d)
tsp

## use some methods 
n_of_cities(tsp)
labels(tsp)
image(tsp)



