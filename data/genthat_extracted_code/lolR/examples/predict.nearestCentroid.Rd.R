library(lolR)


### Name: predict.nearestCentroid
### Title: Nearest Centroid Classifier Prediction
### Aliases: predict.nearestCentroid

### ** Examples

library(lolR)
data <- lol.sims.rtrunk(n=200, d=30)  # 200 examples of 30 dimensions
X <- data$X; Y <- data$Y
model <- lol.classify.nearestCentroid(X, Y)
Yh <- predict(model, X)



