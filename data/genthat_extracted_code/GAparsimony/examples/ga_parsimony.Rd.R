library(GAparsimony)


### Name: ga_parsimony
### Title: GA-PARSIMONY
### Aliases: ga_parsimony show,ga_parsimony-method
###   print,ga_parsimony-method print,ga_parsimony-method numericOrNA
### Keywords: optimize

### ** Examples


#################################
### Example 1: Classification ###
#################################

# This a toy example that shows how to search, for the *iris* database, 
# a parsimony classification NNET model with 'GAparsimony' 
# and 'caret' packages. Validation errors and iterations have been
# reduced to speedup the process

library(GAparsimony)
# Training and testing Datasets
library(caret)

data(iris)
# Z-score of input features
iris_esc <- data.frame(scale(iris[,1:4]),Species=iris[,5])

# Define an 70%/30% train_val/test split of the dataset
set.seed(1234)
inTraining <- createDataPartition(iris_esc$Species, p=.70, list=FALSE)
data_train <- iris_esc[ inTraining,]
data_test  <- iris_esc[-inTraining,]

# Function to evaluate each SVM individual
# ----------------------------------------
fitness_SVM <- function(chromosome, ...)
{
	# First two values in chromosome are 'C' & 'sigma' of 'svmRadial' method
	tuneGrid <- data.frame(C=chromosome[1],sigma=chromosome[2])

	# Next values of chromosome are the selected features (TRUE if > 0.50)
	selec_feat <- chromosome[3:length(chromosome)]>0.50

	# Return -Inf if there is not selected features
	if (sum(selec_feat)<1) return(c(kappa_val=-Inf,kappa_test=-Inf,complexity=Inf))

	# Extract features from the original DB plus response (last column)
	data_train_model <- data_train[,c(selec_feat,TRUE)]
	data_test_model <- data_test[,c(selec_feat,TRUE)]

	# Validate each individual with only a 2-CV
	# Yo obtain a robust validation measure
	# use 'repeatedcv' with more folds and times
	# (see 2nd and 3rd examples...)
	train_control <- trainControl(method = "cv",number = 2)

	# train the model
	set.seed(1234)
	model <- train(Species ~ ., data=data_train_model, 
					trControl=train_control, 
					method="svmRadial", metric="Kappa", 
					tuneGrid=tuneGrid, verbose=FALSE)
				   
	# Extract validation and test accuracy
	accuracy_val <- model$results$Accuracy
	accuracy_test <- postResample(pred=predict(model, data_test_model),
						obs=data_test_model[,ncol(data_test_model)])[2]
	
	# Obtain Complexity = Num_Features*1E6+Number of support vectors
	complexity <- sum(selec_feat)*1E6+model$finalModel@nSV 

	# Return(validation accuracy, testing accuracy, model_complexity)
	vect_errors <- c(accuracy_val=accuracy_val,
					accuracy_test=accuracy_test,complexity=complexity)
	return(vect_errors)
}


# ---------------------------------------------------------------------------------
# Search the best parsimonious model with GA-PARSIMONY by using Feature Selection,
# Parameter Tuning and Parsimonious Model Selection
# ---------------------------------------------------------------------------------
library(GAparsimony)

# Ranges of size and decay
min_param <- c(0.0001, 0.00001)
max_param <- c(0.9999, 0.99999)
names_param <- c("C","sigma")
  
# ga_parsimony can be executed with a different set of 'rerank_error' values
rerank_error <- 0.01
 
GAparsimony_model <- ga_parsimony(fitness=fitness_SVM,
                                  min_param=min_param, 
                                  max_param=max_param,
                                  names_param=names_param,
                                  nFeatures=ncol(data_train)-1,
                                  names_features=colnames(data_train)[-ncol(data_train)],
                                  keep_history = TRUE, 
                                  rerank_error = rerank_error,
                                  popSize = 5, #Change to 40!!!
                                  maxiter = 1, # Change to 100!!!
                                  early_stop=10,
                                  feat_thres=0.90,# Perc selec features in first iter
                                  feat_mut_thres=0.10,# Prob. feature to be 1 in mutation
                                  not_muted=1,
                                  parallel = FALSE, # speedup with 'n' cores or all with TRUE
                                  seed_ini = 1234)


print(paste0("Best Parsimonious SVM with C=",
		   GAparsimony_model@bestsolution['C'],
		   " sigma=",
		   GAparsimony_model@bestsolution['sigma'],
		   " -> ",
		   " AccuracyVal=",
		   round(GAparsimony_model@bestsolution['fitnessVal'],6),
		   " AccuracyTest=",
		   round(GAparsimony_model@bestsolution['fitnessTst'],6),
		   " Num Features=",
		   round(GAparsimony_model@bestsolution['complexity']/1E6,0),
		   " Complexity=",
		   round(GAparsimony_model@bestsolution['complexity'],2)))
  
print(summary(GAparsimony_model))
  
print(parsimony_importance(GAparsimony_model))

## No test: 
  
  #################################
  ### Example 2: Classification ###
  #################################
  
  #This example shows how to search, for the *Sonar* database, 
  #a parsimony classification SVM model with 'GAparsimony' and 'caret' packages.
  
  # Training and testing Datasets
  library(caret)
  library(GAparsimony)
  library(mlbench)
  data(Sonar)
  
  set.seed(1234)
  inTraining <- createDataPartition(Sonar$Class, p=.80, list=FALSE)
  data_train <- Sonar[ inTraining,]
  data_test  <- Sonar[-inTraining,]
  
  # Function to evaluate each SVM individual
  # ----------------------------------------
  fitness_SVM <- function(chromosome, ...)
  {
    # First two values in chromosome are 'C' & 'sigma' of 'svmRadial' method
    tuneGrid <- data.frame(C=chromosome[1],sigma=chromosome[2])
    
    # Next values of chromosome are the selected features (TRUE if > 0.50)
    selec_feat <- chromosome[3:length(chromosome)]>0.50
    
    # Return -Inf if there is not selected features
    if (sum(selec_feat)<1) return(c(kappa_val=-Inf,kappa_test=-Inf,complexity=Inf))
    
    # Extract features from the original DB plus response (last column)
    data_train_model <- data_train[,c(selec_feat,TRUE)]
    data_test_model <- data_test[,c(selec_feat,TRUE)]
    
    # How to validate each individual
    # 'repeats' could be increased to obtain a more robust validation metric. Also,
    # 'number' of folds could be adjusted to improve the measure.
    train_control <- trainControl(method = "repeatedcv",number = 10,repeats = 10)
    
    # train the model
    set.seed(1234)
    model <- train(Class ~ ., data=data_train_model, trControl=train_control, 
                   method="svmRadial", metric="Kappa", 
				   tuneGrid=tuneGrid, verbose=FALSE)
    
    # Extract kappa statistics (repeated k-fold CV and testing kappa)
    kappa_val <- model$results$Kappa
    kappa_test <- postResample(pred=predict(model, data_test_model),
                    obs=data_test_model[,ncol(data_test_model)])[2]
    # Obtain Complexity = Num_Features*1E6+Number of support vectors
    complexity <- sum(selec_feat)*1E6+model$finalModel@nSV 
    
    # Return(validation error, testing error, model_complexity)
    vect_errors <- c(kappa_val=kappa_val,kappa_test=kappa_test,complexity=complexity)
    return(vect_errors)
  }
  
  # ---------------------------------------------------------------------------------
  # Search the best parsimonious model with GA-PARSIMONY by using Feature Selection,
  # Parameter Tuning and Parsimonious Model Selection
  # ---------------------------------------------------------------------------------
  library(GAparsimony)
  
  # Ranges of size and decay
  min_param <- c(00.0001, 0.00001)
  max_param <- c(99.9999, 0.99999)
  names_param <- c("C","sigma")
  
  # ga_parsimony can be executed with a different set of 'rerank_error' values
  rerank_error <- 0.001
  
  
  # 40 individuals per population, 100 max generations with an early stopping 
  # of 10 generations (CAUTION! 7.34 minutes with 8 cores)!!!!!
  GAparsimony_model <- ga_parsimony(fitness=fitness_SVM,
                                    min_param=min_param, 
                                    max_param=max_param,
                                    names_param=names_param,
                                    nFeatures=ncol(data_train)-1,
                                    names_features=colnames(data_train)[-ncol(data_train)],
                                    keep_history = TRUE, 
                                    rerank_error = rerank_error,
                                    popSize = 40, 
                                    maxiter = 100, 
                                    early_stop=10,
                                    feat_thres=0.90,# Perc selec features in first iter
                                    feat_mut_thres=0.10,# Prob. feature to be 1 in mutation
                                    parallel = TRUE, seed_ini = 1234)
  
  print(paste0("Best Parsimonious SVM with C=",
               GAparsimony_model@bestsolution['C'],
               " sigma=",
               GAparsimony_model@bestsolution['sigma'],
               " -> ",
               " KappaVal=",
               round(GAparsimony_model@bestsolution['fitnessVal'],6),
               " KappaTst=",
               round(GAparsimony_model@bestsolution['fitnessTst'],6),
               " Num Features=",
               round(GAparsimony_model@bestsolution['complexity']/1E6,0),
               " Complexity=",
               round(GAparsimony_model@bestsolution['complexity'],2)))
  
  print(summary(GAparsimony_model))
  
  # Plot GA evolution ('keep_history' must be TRUE)
  elitists <- plot(GAparsimony_model)
  
  # Percentage of appearance of each feature in elitists
  print(parsimony_importance(GAparsimony_model))
  
  
  
  
  #############################
  ### Example 3: Regression ###
  #############################
  
  # This example shows how to search, for the *Boston* database, a parsimony regressor ANN 
  # model with 'GAparsimony' and 'caret' packages.
  
  # Load Boston database and scale it
  library(MASS)
  data(Boston)
  Boston_scaled <- data.frame(scale(Boston))
  
  # Define an 80%/20% train/test split of the dataset
  set.seed(1234)
  trainIndex <- createDataPartition(Boston[,"medv"], p=0.80, list=FALSE)
  data_train <- Boston_scaled[trainIndex,]
  data_test <- Boston_scaled[-trainIndex,]
  # Restore 'Response' to original values
  data_train[,ncol(data_train)] <- Boston$medv[trainIndex]
  data_test[,ncol(data_test)] <- Boston$medv[-trainIndex]
  print(dim(data_train))
  print(dim(data_test))
  
  
  # Function to evaluate each ANN individual
  # ----------------------------------------
  fitness_NNET <- function(chromosome, ...)
  {
    # First two values in chromosome are 'size' & 'decay' of 'nnet' method
    tuneGrid <- data.frame(size=round(chromosome[1]),decay=chromosome[2])
    
    # Next values of chromosome are the selected features (TRUE if > 0.50)
    selec_feat <- chromosome[3:length(chromosome)]>0.50
    if (sum(selec_feat)<1) return(c(rmse_val=-Inf,rmse_test=-Inf,complexity=Inf))
    
    # Extract features from the original DB plus response (last column)
    data_train_model <- data_train[,c(selec_feat,TRUE)]
    data_test_model <- data_test[,c(selec_feat,TRUE)]
    
    # How to validate each individual
    # 'repeats' could be increased to obtain a more robust validation metric. Also,
    # 'number' of folds could be adjusted to improve the measure.
    train_control <- trainControl(method = "repeatedcv",number = 10,repeats = 5)
    
    # train the model
    set.seed(1234)
    model <- train(medv ~ ., data=data_train_model, trControl=train_control, 
                   method="nnet", tuneGrid=tuneGrid, trace=FALSE, linout = 1)
    
    # Extract errors
    rmse_val <- model$results$RMSE
    rmse_test <- sqrt(mean((unlist(predict(model, newdata = data_test_model)) - 
                              data_test_model$medv)^2))
    # Obtain Complexity = Num_Features*1E6+sum(neural_weights^2)
    complexity <- sum(selec_feat)*1E6+sum(model$finalModel$wts*model$finalModel$wts)  
    
    # Return(-validation error, -testing error, model_complexity)
    # errors are negative because GA-PARSIMONY tries to maximize values
    vect_errors <- c(rmse_val=-rmse_val,rmse_test=-rmse_test,complexity=complexity)
    return(vect_errors)
  }
  
  # ---------------------------------------------------------------------------------
  # Search the best parsimonious model with GA-PARSIMONY by using Feature Selection,
  # Parameter Tuning and Parsimonious Model Selection
  # ---------------------------------------------------------------------------------
  library(GAparsimony)
  
  # Ranges of size and decay
  min_param <- c(1, 0.0001)
  max_param <- c(25 , 0.9999)
  names_param <- c("size","decay")
  
  # ga_parsimony can be executed with a different set of 'rerank_error' values
  rerank_error <- 0.01  
  
  # 40 individuals per population, 100 max generations with an early stopping 
  # of 10 generations (CAUTION! 33.89 minutes with 8 cores)!!!!!
  GAparsimony_model <- ga_parsimony(fitness=fitness_NNET,
                                    min_param=min_param, 
                                    max_param=max_param,
                                    names_param=names_param,
                                    nFeatures=ncol(data_train)-1,
                                    names_features=colnames(data_train)[-ncol(data_train)],
                                    keep_history = TRUE, 
                                    rerank_error = rerank_error,
                                    popSize = 40,
                                    maxiter = 100, # Change to 100
                                    early_stop=10,
                                    feat_thres=0.90,# Perc selec features in first iter
                                    feat_mut_thres=0.10,# Prob. feature to be 1 in mutation
                                    not_muted=2,
                                    parallel = TRUE, seed_ini = 1234)
  
  print(paste0("Best Parsimonious ANN with ",
               round(GAparsimony_model@bestsolution['size']),
               " hidden neurons and decay=",
               GAparsimony_model@bestsolution['decay'],
               " -> ",
               " RMSEVal=",
               round(-GAparsimony_model@bestsolution['fitnessVal'],6),
               " RMSETst=",
               round(-GAparsimony_model@bestsolution['fitnessTst'],6)))
  print(summary(GAparsimony_model))
  
  # Plot GA evolution ('keep_history' must be TRUE)
  elitists <- plot(GAparsimony_model)
  
  # Percentage of appearance of each feature in elitists
  print(parsimony_importance(GAparsimony_model))
## End(No test)
		 



