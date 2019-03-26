library(Cubist)


### Name: predict.cubist
### Title: Predict method for cubist fits
### Aliases: predict.cubist
### Keywords: models

### ** Examples


library(mlbench)
data(BostonHousing)

## 1 committee and no instance-based correction, so just an M5 fit:
mod1 <- cubist(x = BostonHousing[, -14], y = BostonHousing$medv)
predict(mod1, BostonHousing[1:4, -14])

## now add instances
predict(mod1, BostonHousing[1:4, -14], neighbors = 5)

# Example error 
iris_test <- iris
iris_test$Species <- as.character(iris_test$Species)

mod <- cubist(x = iris_test[1:99, 2:5], 
              y = iris_test$Sepal.Length[1:99])
              
# predict(mod, iris_test[100:151, 2:5])
# Error: 
# *** line 2 of `undefined.cases':
# bad value of 'virginica' for attribute 'Species'



