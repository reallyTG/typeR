library(DMwR)


### Name: class.eval
### Title: Calculate Some Standard Classification Evaluation Statistics
### Aliases: class.eval
### Keywords: models

### ** Examples

## Calculating several statistics of a classification tree on the Iris data
data(iris)
idx <- sample(1:nrow(iris),100)
train <- iris[idx,]
test <- iris[-idx,]
tree <- rpartXse(Species ~ .,train)
preds <- predict(tree,test,type='class')
## Calculate the accuracy and error rate
class.eval(test$Species,preds)
## Now trying calculating the utility of the predictions
cbM <- matrix(c(10,-20,-20,-20,20,-10,-20,-10,20),3,3)
class.eval(test$Species,preds,"totU",cbM)



