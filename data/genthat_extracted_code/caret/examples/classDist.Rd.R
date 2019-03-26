library(caret)


### Name: classDist
### Title: Compute and predict the distances to class centroids
### Aliases: classDist classDist.default predict.classDist
### Keywords: manip

### ** Examples

trainSet <- sample(1:150, 100)

distData <- classDist(iris[trainSet, 1:4],
                      iris$Species[trainSet])

newDist <- predict(distData,
                   iris[-trainSet, 1:4])

splom(newDist, groups = iris$Species[-trainSet])




