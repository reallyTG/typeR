library(distory)


### Name: gromov.hyperbolicity
### Title: Gromov Hyperbolicity Constant
### Aliases: gromov.hyperbolicity

### ** Examples


# scale final delta by max distance
points <- cbind(runif(100), runif(100))
d <- dist(points)
gromov.hyperbolicity(d)/max(d)

# scale each delta by max distance for the 4 points
points <- cbind(runif(100), runif(100))
d <- dist(points)
gromov.hyperbolicity(d, scale="max")

# scale each delta by the max perimeter for the 4 points
points <- cbind(runif(100), runif(100))
d <- dist(points)
gromov.hyperbolicity(d, scale="max")




