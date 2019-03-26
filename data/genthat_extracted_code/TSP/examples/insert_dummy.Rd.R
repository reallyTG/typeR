library(TSP)


### Name: insert_dummy
### Title: Insert dummy cities into a distance matrix
### Aliases: insert_dummy
### Keywords: manip

### ** Examples

## make runs comparable
set.seed(4444)

data("iris")
tsp <- TSP(dist(iris[-5]))

## insert 2 dummy cities
tsp_dummy <- insert_dummy(tsp, n = 2, label = "boundary")

## get a solution for the TSP
tour <- solve_TSP(tsp_dummy)

## plot the distance matrix
image(tsp_dummy, tour)

## draw lines where the dummy cities are located
abline(h = which(labels(tour)=="boundary"), col = "red")
abline(v = which(labels(tour)=="boundary"), col = "red")



