library(TSP)


### Name: ATSP
### Title: Class ATSP - Asymmetric traveling salesperson problem
### Aliases: ATSP as.ATSP as.ATSP.dist as.ATSP.matrix n_of_cities.ATSP
###   print.ATSP labels.ATSP image.ATSP as.matrix as.matrix.ATSP
### Keywords: classes

### ** Examples

data <- matrix(runif(10^2), ncol = 10, dimnames = list(1:10, 1:10))

atsp <- ATSP(data)
atsp

## use some methods
n_of_cities(atsp)
labels(atsp)

## calculate a tour
tour <- solve_TSP(atsp, method = "nn")
tour
  
tour_length(tour)

image(atsp, tour)



