library(adabag)


### Name: margins
### Title: Calculates the margins
### Aliases: margins
### Keywords: tree classif

### ** Examples


#Iris example
library(rpart)
data(iris)
sub <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150, 25))
iris.adaboost <- boosting(Species ~ ., data=iris[sub,], mfinal=3)
margins(iris.adaboost,iris[sub,])->iris.margins # training set
plot.margins(iris.margins)

# test set
iris.predboosting<- predict.boosting(iris.adaboost, newdata=iris[-sub,])
margins(iris.predboosting,iris[-sub,])->iris.predmargins 
plot.margins(iris.predmargins,iris.margins)

#Examples with bagging
iris.bagging <- bagging(Species ~ ., data=iris[sub,], mfinal=3)
margins(iris.bagging,iris[sub,])->iris.bagging.margins # training set

iris.predbagging<- predict.bagging(iris.bagging, newdata=iris[-sub,])
margins(iris.predbagging,iris[-sub,])->iris.bagging.predmargins # test set
par(bg="lightyellow")
plot.margins(iris.bagging.predmargins,iris.bagging.margins)





