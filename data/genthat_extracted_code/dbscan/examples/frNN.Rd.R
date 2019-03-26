library(dbscan)


### Name: frNN
### Title: Find the Fixed Radius Nearest Neighbors
### Aliases: frNN frnn sort.frNN
### Keywords: model

### ** Examples

data(iris)
x <- iris[, -5]

# Find fixed radius nearest neighbors for each point
nn <- frNN(x, eps=.5)

# Number of neighbors
hist(sapply(adjacencylist(nn), length),
  xlab = "k", main="Number of Neighbors",
  sub = paste("Neighborhood size eps =", nn$eps))

# Explore neighbors of point i = 10
i <- 10
nn$id[[i]]
nn$dist[[i]]
plot(x, col = ifelse(1:nrow(iris) %in% nn$id[[i]], "red", "black"))

# get an adjacency list
head(adjacencylist(nn))

# plot the fixed radius neighbors (and then reduced to a radius of .3)
plot(nn, x)
plot(frNN(nn, .3), x)

## manually create a frNN object for dbscan (dbscan only needs ids and eps)
nn <- list(ids = list(c(2,3), c(1,3), c(1,2,3), c(3,5), c(4,5)), eps = 1)
class(nn) <- c("NN", "frNN")
nn
dbscan(nn, minPts = 2)



