library(dismo)


### Name: gbm.step
### Title: gbm step
### Aliases: gbm.step
### Keywords: spatial

### ** Examples

data(Anguilla_train)
# reduce data set to speed things up a bit
Anguilla_train = Anguilla_train[1:200,]
angaus.tc5.lr01 <- gbm.step(data=Anguilla_train, gbm.x = 3:14, gbm.y = 2, family = "bernoulli",
       tree.complexity = 5, learning.rate = 0.01, bag.fraction = 0.5)



