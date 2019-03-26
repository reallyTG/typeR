library(regclass)


### Name: confusion_matrix
### Title: Confusion matrix for logistic regression models
### Aliases: confusion.matrix confusion_matrix

### ** Examples


  #On WINE data as a whole
  data(WINE)
  M <- glm(Quality~.,data=WINE,family=binomial)
  confusion_matrix(M)
  
  #Calculate generalization error using training/holdout
  set.seed(1010)
  train.rows <- sample(nrow(WINE),0.7*nrow(WINE),replace=TRUE)
  TRAIN <- WINE[train.rows,]
  HOLDOUT <- WINE[-train.rows,]
  M <- glm(Quality~.,data=TRAIN,family=binomial)
	confusion_matrix(M,HOLDOUT)
	
	
	#Predicting donation
	#Model predicting from recent average gift amount is significant, but its
	#classifications are the same as the naive model (majority rules)
	data(DONOR)
	M.naive <- glm(Donate~1,data=DONOR,family=binomial)
	confusion_matrix(M.naive)
	M <- glm(Donate~RECENT_AVG_GIFT_AMT,data=DONOR,family=binomial)
	confusion_matrix(M)
	
	 


