library(manymodelr)


### Name: multi_model_1
### Title: Simultaneously train and predict on new data.
### Aliases: multi_model_1

### ** Examples

library(caret)
train_set<-createDataPartition(iris$Species,p=0.8,list=FALSE)
valid_set<-iris[-train_set,]
train_set<-iris[train_set,]
ctrl<-trainControl(method="cv",number=5)
set.seed(233)
m<-multi_model_1(train_set,"Species",".",c("knn","rpart"),
                "Accuracy",ctrl,newdata =valid_set)
m$Predictions
m$Metrics



