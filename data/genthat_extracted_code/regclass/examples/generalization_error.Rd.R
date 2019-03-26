library(regclass)


### Name: generalization_error
### Title: Calculating the generalization error of a model on a set of data
### Aliases: generalization.error generalization_error

### ** Examples


  #Education analytics
  data(STUDENT)
  set.seed(1010)
  train.rows <- sample(1:nrow(STUDENT),0.7*nrow(STUDENT))
  TRAIN <- STUDENT[train.rows,]
  HOLDOUT <- STUDENT[-train.rows,]
  M <- lm(CollegeGPA~.,data=TRAIN)
  #Also estimate the generalization error of the model
  generalization_error(M,HOLDOUT,Kfold=TRUE,seed=5020)
  #Try partition and randomforest, though they do not perform as well as regression here
  TREE <- rpart(CollegeGPA~.,data=TRAIN)
  FOREST <- randomForest(CollegeGPA~.,data=TRAIN)
  generalization_error(TREE,HOLDOUT)
  generalization_error(FOREST,HOLDOUT) 

  #Wine
  data(WINE)
  set.seed(2020)
  train.rows <- sample(1:nrow(WINE),0.7*nrow(WINE))
  TRAIN <- WINE[train.rows,]
  HOLDOUT <- WINE[-train.rows,]
  M <- glm(Quality~.^2,data=TRAIN,family=binomial)
  generalization_error(M,HOLDOUT)
  #Random forest predicts best on the holdout sample
  TREE <- rpart(Quality~.,data=TRAIN)
  FOREST <- randomForest(Quality~.,data=TRAIN)
  generalization_error(TREE,HOLDOUT)
  generalization_error(FOREST,HOLDOUT) 




