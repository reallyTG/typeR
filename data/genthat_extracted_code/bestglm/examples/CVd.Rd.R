library(bestglm)


### Name: CVd
### Title: Cross-validation using delete-d method.
### Aliases: CVd
### Keywords: models regression

### ** Examples

#Example 1. delete-d method
#For the training set, n=67. So 10-fold CV is like using delete-d
#with d=7, approximately.
data(zprostate)
train<-(zprostate[zprostate[,10],])[,-10]
X<-train[,1:2]
y<-train[,9]
set.seed(123321123)
CVd(X, y, d=7, REP=10)
#should set to 1000. Used 10 to save time in example.



