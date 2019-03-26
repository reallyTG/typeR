library(regclass)


### Name: build_model
### Title: Variable selection for descriptive or predictive linear and
###   logistic regression models
### Aliases: build.model build_model

### ** Examples


  #Descriptive model.  Note: Tip and Bill should not be used simultaneously as 
  #predictors of TipPercentage, so leave Tip out since it's not known ahead of time
  data(TIPS)
  MODELS <- build_model(TipPercentage~.-Tip,data=TIPS,type="descriptive")
  MODELS$AICtable
  MODELS$predictors[[1]] #Variable in best model with a single predictors
  MODELS$predictors[[2]] #Variables in best model with two predictors
  summary(MODELS$bestmodel) #Summary of best model, in this case with two predictors

  #Another descriptive model (large dataset so changing prompt=FALSE for documentation)
  data(PURCHASE)
  set.seed(320)
  #Take a subset of full dataframe for quick illustration
  SUBSET <- PURCHASE[sample(nrow(PURCHASE),500),]
  MODELS <- build_model(Purchase~.,data=SUBSET,type="descriptive",prompt=FALSE)
  MODELS$AICtable  #Model with 1 or 2 variables look pretty good
  #Predict whether a purchase is made by # of previous visits and distance to store
	MODELS$predictors[[2]]  

  #Predictive model.  
  data(SALARY)
  set.seed(2010)
  train.rows <- sample(nrow(SALARY),0.7*nrow(SALARY),replace=TRUE)
  TRAIN <- SALARY[train.rows,]
  HOLDOUT <- SALARY[-train.rows,]
  MODELS <- build_model(Salary~.^2,data=TRAIN,holdout=HOLDOUT)
  summary(MODELS$bestmodel)
  M <- lm(Salary~Gender+Education:Months,data=TRAIN)
  generalization_error(M,HOLDOUT)
  
  #Predictive model for WINE data, takes a while.  Misclassification rate on holdout sample is 18%.
  data(WINE)
  set.seed(2010)
  train.rows <- sample(nrow(WINE),0.7*nrow(WINE),replace=TRUE)
  TRAIN <- WINE[train.rows,]
  HOLDOUT <- WINE[-train.rows,]
  ## Not run: MODELS <- build_model(Quality~.,data=TRAIN,seed=1919,holdout=HOLDOUT)
  ## Not run: MODELS$CVtable
	 


