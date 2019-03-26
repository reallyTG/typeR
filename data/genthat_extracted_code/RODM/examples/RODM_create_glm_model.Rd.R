library(RODM)


### Name: RODM_create_glm_model
### Title: Create an ODM Generalized Linear Model
### Aliases: RODM_create_glm_model
### Keywords: classif

### ** Examples

## Not run: 
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid= "rodm", pwd = "rodm")
##D 
##D ### GLM Classification
##D 
##D # Predicting survival in the sinking of the Titanic based on pasenger's sex, age, class, etc.
##D 
##D data(titanic3, package="PASWR")                                             # Load survival data from Titanic
##D ds <- titanic3[,c("pclass", "survived", "sex", "age", "fare", "embarked")]  # Select subset of attributes
##D ds[,"survived"] <- ifelse(ds[,"survived"] == 1, "Yes", "No")                # Rename target values
##D n.rows <- length(ds[,1])                                                    # Number of rows
##D random_sample <- sample(1:n.rows, ceiling(n.rows/2))   # Split dataset randomly in train/test subsets
##D titanic_train <- ds[random_sample,]                         # Training set
##D train.rows <- length(titanic_train[,1])                                                    # Number of rows
##D row.id <- matrix(seq(1, train.rows), nrow=train.rows, ncol=1, dimnames= list(NULL, c("ROW_ID"))) # Row id
##D titanic_train <- cbind(row.id, titanic_train)                                                     # Add row id to dataset 
##D titanic_test <-  ds[setdiff(1:n.rows, random_sample),]      # Test set
##D RODM_create_dbms_table(DB, "titanic_train")   # Push the training table to the database
##D RODM_create_dbms_table(DB, "titanic_test")    # Push the testing table to the database
##D 
##D # Weight one class more heavily than the other
##D weights <- data.frame(
##D             target_value = c("Yes", "No"),
##D             class_weight = c(1, 10))
##D 
##D glm <- RODM_create_glm_model(database = DB,    # Create ODM GLM classification model
##D                              data_table_name = "titanic_train", 
##D                              case_id_column_name = "ROW_ID",
##D                              target_column_name = "survived", 
##D                              model_name = "GLM_MODEL",
##D                              class_weights = weights,
##D                              diagnostics_table_name = "GLM_DIAG",
##D                              mining_function = "classification")
##D 
##D glm2 <- RODM_apply_model(database = DB,    # Predict test data
##D                          data_table_name = "titanic_test", 
##D                          model_name = "GLM_MODEL",
##D                          supplemental_cols = "survived")
##D 
##D print(glm2$model.apply.results[1:10,])                                  # Print example of prediction results
##D actual <- glm2$model.apply.results[, "SURVIVED"]                
##D predicted <- glm2$model.apply.results[, "PREDICTION"]                
##D probs <- as.real(as.character(glm2$model.apply.results[, "'Yes'"]))       
##D table(actual, predicted, dnn = c("Actual", "Predicted"))              # Confusion matrix
##D library(verification)
##D perf.auc <- roc.area(ifelse(actual == "Yes", 1, 0), probs)            # Compute ROC and plot
##D auc.roc <- signif(perf.auc$A, digits=3)
##D auc.roc.p <- signif(perf.auc$p.value, digits=3)
##D roc.plot(ifelse(actual == "Yes", 1, 0), probs, binormal=T, plot="both", xlab="False Positive Rate", 
##D          ylab="True Postive Rate", main= "Titanic survival ODM GLM model ROC Curve")
##D text(0.7, 0.4, labels= paste("AUC ROC:", signif(perf.auc$A, digits=3)))
##D text(0.7, 0.3, labels= paste("p-value:", signif(perf.auc$p.value, digits=3)))
##D 
##D glm       # look at the model details
##D 
##D # access and look at the per-row diagnostics from model training
##D diaginfo <- sqlQuery(DB, query = "SELECT * FROM GLM_DIAG")
##D diaginfo
##D 
##D RODM_drop_model(DB, "GLM_MODEL")            # Drop the model
##D RODM_drop_dbms_table(DB, "GLM_DIAG")        # Drop the diagnostics table
##D RODM_drop_dbms_table(DB, "titanic_train")   # Drop the database table
##D RODM_drop_dbms_table(DB, "titanic_test")    # Drop the database table
## End(Not run)

### GLM Regression
## Not run: 
##D x1 <- 2 * runif(200) 
##D noise <- 3 * runif(200) - 1.5
##D y1 <- 2 + 2*x1 + x1*x1 + noise
##D dataset <- data.frame(x1, y1)
##D names(dataset) <- c("X1", "Y1")
##D RODM_create_dbms_table(DB, "dataset")   # Push the training table to the database
##D 
##D glm <- RODM_create_glm_model(database = DB,    # Create ODM GLM model
##D                              data_table_name = "dataset", 
##D                              target_column_name = "Y1",
##D                              mining_function = "regression")
##D 
##D glm2 <- RODM_apply_model(database = DB,    # Predict training data
##D                              data_table_name = "dataset",
##D                              model_name = "GLM_MODEL",
##D                              supplemental_cols = "X1")
##D windows(height=8, width=12)
##D plot(x1, y1, pch=20, col="blue")
##D points(x=glm2$model.apply.results[, "X1"], 
##D        glm2$model.apply.results[, "PREDICTION"], pch=20, col="red")
##D legend(0.5, 9, legend = c("actual", "GLM regression"), pch = c(20, 20), 
##D                 col = c("blue", "red"),
##D                 pt.bg =  c("blue", "red"), cex = 1.20, pt.cex=1.5, bty="n")
##D 
##D RODM_drop_model(DB, "GLM_MODEL")            # Drop the model
##D RODM_drop_dbms_table(DB, "dataset")   # Drop the database table
##D RODM_close_dbms_connection(DB)
## End(Not run)



