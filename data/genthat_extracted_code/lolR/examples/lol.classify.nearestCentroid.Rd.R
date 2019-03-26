library(lolR)


### Name: lol.classify.nearestCentroid
### Title: Nearest Centroid Classifier Training
### Aliases: lol.classify.nearestCentroid

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.classify.nearestCentroid(X, Y)



