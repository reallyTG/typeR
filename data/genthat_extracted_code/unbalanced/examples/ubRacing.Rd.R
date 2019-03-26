library(unbalanced)


### Name: ubRacing
### Title: Racing
### Aliases: ubRacing

### ** Examples

#use Racing to select the best technique for an unbalanced dataset
library(unbalanced)
data(ubIonosphere)

#configure sampling parameters
ubConf <- list(type="ubUnder", percOver=200, percUnder=200, k=2, perc=50, method="percPos", w=NULL)

#load the classification algorithm that you intend to use inside the Race
#see 'mlr' package for supported algorithms
library(randomForest)
#use only 5 trees
results <- ubRacing(Class ~., ubIonosphere, "randomForest", positive=1, ubConf=ubConf, ntree=5)

# try with 500 trees
# results <- ubRacing(Class ~., ubIonosphere, "randomForest", positive=1, ubConf=ubConf, ntree=500)
# let's try with a different algorithm
# library(e1071)
# results <- ubRacing(Class ~., ubIonosphere, "svm", positive=1, ubConf=ubConf)
# library(rpart)
# results <- ubRacing(Class ~., ubIonosphere, "rpart", positive=1, ubConf=ubConf)



