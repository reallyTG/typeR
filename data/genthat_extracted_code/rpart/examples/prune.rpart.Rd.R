library(rpart)


### Name: prune.rpart
### Title: Cost-complexity Pruning of an Rpart Object
### Aliases: prune.rpart prune
### Keywords: tree

### ** Examples

z.auto <- rpart(Mileage ~ Weight, car.test.frame)
zp <- prune(z.auto, cp = 0.1)
plot(zp) #plot smaller rpart object



