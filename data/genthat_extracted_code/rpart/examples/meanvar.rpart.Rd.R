library(rpart)


### Name: meanvar.rpart
### Title: Mean-Variance Plot for an Rpart Object
### Aliases: meanvar meanvar.rpart
### Keywords: tree

### ** Examples

z.auto <- rpart(Mileage ~ Weight, car.test.frame)
meanvar(z.auto, log = 'xy')



