library(RODM)


### Name: RODM_create_dt_model
### Title: Create a Decision Tree (DT) model
### Aliases: RODM_create_dt_model
### Keywords: classif

### ** Examples

## Not run: 
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid= "rodm", pwd = "rodm")
##D 
##D # Predicting survival in the sinking of the Titanic based on pasenger's sex, age, class, etc.
##D data(titanic3, package="PASWR")                                             # Load survival data from Titanic
##D ds <- titanic3[,c("pclass", "survived", "sex", "age", "fare", "embarked")]  # Select subset of attributes
##D ds[,"survived"] <- ifelse(ds[,"survived"] == 1, "Yes", "No")                # Rename target values
##D n.rows <- length(ds[,1])                                                    # Number of rows
##D random_sample <- sample(1:n.rows, ceiling(n.rows/2))   # Split dataset randomly in train/test subsets
##D titanic_train <- ds[random_sample,]                         # Training set
##D titanic_test <-  ds[setdiff(1:n.rows, random_sample),]      # Test set
##D RODM_create_dbms_table(DB, "titanic_train")   # Push the training table to the database
##D RODM_create_dbms_table(DB, "titanic_test")    # Push the testing table to the database
##D 
##D dt <- RODM_create_dt_model(database = DB,    # Create ODM DT classification model
##D                              data_table_name = "titanic_train", 
##D                              target_column_name = "survived", 
##D                              model_name = "DT_MODEL")
##D 
##D dt2 <- RODM_apply_model(database = DB,    # Predict test data
##D                          data_table_name = "titanic_test", 
##D                          model_name = "DT_MODEL",
##D                          supplemental_cols = "survived")
##D 
##D print(dt2$model.apply.results[1:10,])                                  # Print example of prediction results
##D actual <- dt2$model.apply.results[, "SURVIVED"]                
##D predicted <- dt2$model.apply.results[, "PREDICTION"]                
##D probs <- as.real(as.character(dt2$model.apply.results[, "'Yes'"]))       
##D table(actual, predicted, dnn = c("Actual", "Predicted"))              # Confusion matrix
##D library(verification)
##D perf.auc <- roc.area(ifelse(actual == "Yes", 1, 0), probs)            # Compute ROC and plot
##D auc.roc <- signif(perf.auc$A, digits=3)
##D auc.roc.p <- signif(perf.auc$p.value, digits=3)
##D roc.plot(ifelse(actual == "Yes", 1, 0), probs, binormal=T, plot="both", xlab="False Positive Rate", 
##D          ylab="True Postive Rate", main= "Titanic survival ODM DT model ROC Curve")
##D text(0.7, 0.4, labels= paste("AUC ROC:", signif(perf.auc$A, digits=3)))
##D text(0.7, 0.3, labels= paste("p-value:", signif(perf.auc$p.value, digits=3)))
##D 
##D dt        # look at the model details
##D 
##D RODM_drop_model(DB, "DT_MODEL")             # Drop the model
##D RODM_drop_dbms_table(DB, "titanic_train")   # Drop the database table
##D RODM_drop_dbms_table(DB, "titanic_test")    # Drop the database table
##D 
##D RODM_close_dbms_connection(DB)
## End(Not run)



