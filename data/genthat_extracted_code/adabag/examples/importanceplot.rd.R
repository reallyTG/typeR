library(adabag)


### Name: importanceplot
### Title: Plots the variables relative importance
### Aliases: importanceplot
### Keywords: tree classif

### ** Examples

#Examples
#Iris example
library(rpart)
data(iris)
sub <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150, 25))
iris.adaboost <- boosting(Species ~ ., data=iris[sub,], mfinal=3)
importanceplot(iris.adaboost)

#Examples with bagging
#iris.bagging <- bagging(Species ~ ., data=iris[sub,], mfinal=5)
#importanceplot(iris.bagging, horiz=TRUE, cex.names=.6)




