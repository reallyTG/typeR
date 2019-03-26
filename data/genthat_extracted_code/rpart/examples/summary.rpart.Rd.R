library(rpart)


### Name: summary.rpart
### Title: Summarize a Fitted Rpart Object
### Aliases: summary.rpart
### Keywords: tree

### ** Examples

## a regression tree
z.auto <- rpart(Mileage ~ Weight, car.test.frame)
summary(z.auto)

## a classification tree with multiple variables and surrogate splits.
summary(rpart(Kyphosis ~ Age + Number + Start, data = kyphosis))



