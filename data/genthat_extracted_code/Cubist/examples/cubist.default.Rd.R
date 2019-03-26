library(Cubist)


### Name: cubist.default
### Title: Fit a Cubist model
### Aliases: cubist.default cubist
### Keywords: models

### ** Examples


library(mlbench)
data(BostonHousing)

## 1 committee, so just an M5 fit:
mod1 <- cubist(x = BostonHousing[, -14], y = BostonHousing$medv)
mod1

## Now with 10 committees
mod2 <- cubist(x = BostonHousing[, -14], y = BostonHousing$medv, committees = 10)
mod2




