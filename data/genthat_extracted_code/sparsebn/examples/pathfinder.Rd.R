library(sparsebn)


### Name: pathfinder
### Title: The pathfinder network
### Aliases: pathfinder
### Keywords: datasets

### ** Examples


### Create a valid sparsebnData object from the simulated pathfinder data
data(pathfinder)
dat <- sparsebnData(pathfinder$data, type = "c")

### Code to reproduce this dataset by randomly generating edge weights
coefs <- runif(n = num.edges(pathfinder$dag), min = 0.5, max = 2) # coefficients
vars <- rep(1, num.nodes(pathfinder$dag))                         # variances
params <- c(coefs, vars)                                          # parameter vector
pathfinder.data <- generate_mvn_data(graph = pathfinder$dag,
                                     params = params,
                                     n = 1000)




