library(RODM)


### Name: RODM_create_nb_model
### Title: Create a Naive Bayes model
### Aliases: RODM_create_nb_model
### Keywords: classif

### ** Examples

# Predicting survival in the sinking of the Titanic based on pasenger's sex, age, class, etc.
## Not run: 
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid= "rodm", pwd = "rodm")
##D 
##D data(titanic3, package="PASWR")                                             # Load survival data from Titanic
##D ds <- titanic3[,c("pclass", "survived", "sex", "age", "fare", "embarked")]  # Select subset of attributes
##D ds[,"survived"] <- ifelse(ds[,"survived"] == 1, "Yes", "No")                # Rename target values
##D n.rows <- length(ds[,1])                                                    # Number of rows
##D set.seed(seed=6218945)
##D random_sample <- sample(1:n.rows, ceiling(n.rows/2))   # Split dataset randomly in train/test subsets
##D titanic_train <- ds[random_sample,]                         # Training set
##D titanic_test <-  ds[setdiff(1:n.rows, random_sample),]      # Test set
##D 
##D RODM_create_dbms_table(DB, "titanic_train")   # Push the training table to the database
##D RODM_create_dbms_table(DB, "titanic_test")    # Push the testing table to the database
##D 
##D # If the target distribution does not reflect the actual distribution due
##D # to specialized sampling, specify priors for the model
##D priors <- data.frame(
##D            target_value = c("Yes", "No"),
##D            prior_probability = c(0.1, 0.9))
##D 
##D # Create an ODM Naive Bayes model
##D nb <- RODM_create_nb_model(
##D    database = DB,                     # Database ODBC channel identifier
##D    model_name = "titanic_nb_model",   # ODM model name
##D    data_table_name = "titanic_train", # (in quotes) Data frame or database table containing the input dataset
##D    class_priors = priors,             # user-specified priors
##D    target_column_name = "survived")   # Target column name in data_table_name		
##D 
##D # Predict test data using the Naive Bayes model
##D nb2 <- RODM_apply_model(
##D    database = DB,                    # Database ODBC channel identifier
##D    data_table_name = "titanic_test", # Database table containing the input dataset
##D    model_name = "titanic_nb_model",  # ODM model name
##D    supplemental_cols = "survived")   # Carry the target column to the output for analysis
##D 
##D # Compute contingency matrix, performance statistics and ROC curve
##D print(nb2$model.apply.results[1:10,])                                  # Print example of prediction results
##D actual <- nb2$model.apply.results[, "SURVIVED"]                
##D predicted <- nb2$model.apply.results[, "PREDICTION"]                
##D probs <- as.real(as.character(nb2$model.apply.results[, "'Yes'"]))       
##D table(actual, predicted, dnn = c("Actual", "Predicted"))              # Confusion matrix
##D 
##D library(verification)
##D perf.auc <- roc.area(ifelse(actual == "Yes", 1, 0), probs)            # Compute ROC and plot
##D auc.roc <- signif(perf.auc$A, digits=3)
##D auc.roc.p <- signif(perf.auc$p.value, digits=3)
##D roc.plot(ifelse(actual == "Yes", 1, 0), probs, binormal=T, plot="both", xlab="False Positive Rate", 
##D          ylab="True Postive Rate", main= "Titanic survival ODM NB model ROC Curve")
##D text(0.7, 0.4, labels= paste("AUC ROC:", signif(perf.auc$A, digits=3)))
##D text(0.7, 0.3, labels= paste("p-value:", signif(perf.auc$p.value, digits=3)))
##D 
##D nb        # look at the model details
##D 
##D RODM_drop_model(DB, "titanic_nb_model")     # Drop the model
##D RODM_drop_dbms_table(DB, "titanic_train")   # Drop the training table in the database
##D RODM_drop_dbms_table(DB, "titanic_test")    # Drop the testing table in the database
##D 
##D RODM_close_dbms_connection(DB)
## End(Not run)



