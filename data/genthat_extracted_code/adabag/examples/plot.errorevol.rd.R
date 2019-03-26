library(adabag)


### Name: plot.errorevol
### Title: Plots the error evolution of the ensemble
### Aliases: plot.errorevol
### Keywords: tree classif

### ** Examples

data(iris)
train <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150, 25))

cntrl<-rpart.control(maxdepth=1)
#increase mfinal in your own execution of this example to see 
#the real usefulness of this function
iris.adaboost <- boosting(Species ~ ., data=iris[train,], mfinal=10, control=cntrl)

#Error evolution along the iterations in training set 
errorevol(iris.adaboost,iris[train,])->evol.train
plot.errorevol(evol.train)

#comparing error evolution in training and test set
errorevol(iris.adaboost,iris[-train,])->evol.test
plot.errorevol(evol.test, evol.train)

# See the help of the functions error evolution and boosting 
# for more examples of the use of the error evolution




