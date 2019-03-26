library(RODM)


### Name: RODM_create_svm_model
### Title: Create an ODM Support Vector Machine model
### Aliases: RODM_create_svm_model
### Keywords: classif

### ** Examples

## Not run: 
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid= "rodm", pwd = "rodm")
##D 
##D # Separating three Gaussian classes in 2D
##D 
##D X1 <- c(rnorm(200, mean = 2, sd = 1), rnorm(300, mean = 8, sd = 2), rnorm(300, mean = 5, sd = 0.6))
##D Y1 <- c(rnorm(200, mean = 1, sd = 2), rnorm(300, mean = 4, sd = 1.5), rnorm(300, mean = 6, sd = 0.5))
##D target <- c(rep(1, 200), rep(2, 300), rep(3, 300)) 
##D ds <- data.frame(cbind(X1, Y1, target)) 
##D n.rows <- length(ds[,1])                                                    # Number of rows
##D set.seed(seed=6218945)
##D random_sample <- sample(1:n.rows, ceiling(n.rows/2))   # Split dataset randomly in train/test subsets
##D ds_train <- ds[random_sample,]                         # Training set
##D ds_test <-  ds[setdiff(1:n.rows, random_sample),]      # Test set
##D RODM_create_dbms_table(DB, "ds_train")   # Push the training table to the database
##D RODM_create_dbms_table(DB, "ds_test")    # Push the testing table to the database
##D 
##D svm <- RODM_create_svm_model(database = DB,    # Create ODM SVM classification model
##D                              data_table_name = "ds_train", 
##D                              target_column_name = "target")
##D 
##D svm2 <- RODM_apply_model(database = DB,    # Predict test data
##D                          data_table_name = "ds_test", 
##D                          model_name = "SVM_MODEL",
##D                          supplemental_cols = c("X1","Y1","TARGET"))
##D 
##D color.map <- c("blue", "green", "red")
##D color <- color.map[svm2$model.apply.results[, "TARGET"]]
##D plot(svm2$model.apply.results[, "X1"],
##D      svm2$model.apply.results[, "Y1"],
##D      pch=20, col=color, ylim=c(-2,10), xlab="X1", ylab="Y1", 
##D      main="Test Set")
##D actual <- svm2$model.apply.results[, "TARGET"]
##D predicted <- svm2$model.apply.results[, "PREDICTION"]
##D for (i in 1:length(ds_test[,1])) {
##D    if (actual[i] != predicted[i]) 
##D     points(x=svm2$model.apply.results[i, "X1"],
##D            y=svm2$model.apply.results[i, "Y1"],
##D            col = "black", pch=20)
##D }
##D legend(6, 1.5, legend=c("Class 1 (correct)", "Class 2 (correct)", "Class 3 (correct)", "Error"), 
##D        pch = rep(20, 4), col = c(color.map, "black"), pt.bg = c(color.map, "black"), cex = 1.20, 
##D        pt.cex=1.5, bty="n")
##D 
##D RODM_drop_model(DB, "SVM_MODEL")       # Drop the model
##D RODM_drop_dbms_table(DB, "ds_train")   # Drop the database table
##D RODM_drop_dbms_table(DB, "ds_test")    # Drop the database table
## End(Not run)

### SVM Classification

# Predicting survival in the sinking of the Titanic based on pasenger's sex, age, class, etc.
## Not run: 
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
##D svm <- RODM_create_svm_model(database = DB,    # Create ODM SVM classification model
##D                              data_table_name = "titanic_train", 
##D                              target_column_name = "survived", 
##D                              model_name = "SVM_MODEL",
##D                              mining_function = "classification")
##D 
##D svm2 <- RODM_apply_model(database = DB,    # Predict test data
##D                          data_table_name = "titanic_test", 
##D                          model_name = "SVM_MODEL",
##D                          supplemental_cols = "survived")
##D 
##D print(svm2$model.apply.results[1:10,])                                  # Print example of prediction results
##D actual <- svm2$model.apply.results[, "SURVIVED"]                
##D predicted <- svm2$model.apply.results[, "PREDICTION"]                
##D probs <- as.real(as.character(svm2$model.apply.results[, "'Yes'"]))       
##D table(actual, predicted, dnn = c("Actual", "Predicted"))              # Confusion matrix
##D library(verification)
##D perf.auc <- roc.area(ifelse(actual == "Yes", 1, 0), probs)            # Compute ROC and plot
##D auc.roc <- signif(perf.auc$A, digits=3)
##D auc.roc.p <- signif(perf.auc$p.value, digits=3)
##D roc.plot(ifelse(actual == "Yes", 1, 0), probs, binormal=T, plot="both", xlab="False Positive Rate", 
##D          ylab="True Postive Rate", main= "Titanic survival ODM SVM model ROC Curve")
##D text(0.7, 0.4, labels= paste("AUC ROC:", signif(perf.auc$A, digits=3)))
##D text(0.7, 0.3, labels= paste("p-value:", signif(perf.auc$p.value, digits=3)))
##D 
##D RODM_drop_model(DB, "SVM_MODEL")            # Drop the model
##D RODM_drop_dbms_table(DB, "titanic_train")   # Drop the database table
##D RODM_drop_dbms_table(DB, "titanic_test")    # Drop the database table
## End(Not run)

### SVM Regression

# Aproximating a one-dimensional non-linear function
## Not run: 
##D X1 <- 10 * runif(500) - 5 
##D Y1 <- X1*cos(X1) + 2*runif(500) 
##D ds <- data.frame(cbind(X1, Y1)) 
##D RODM_create_dbms_table(DB, "ds")   # Push the training table to the database
##D 
##D svm <- RODM_create_svm_model(database = DB,    # Create ODM SVM regression model
##D                              data_table_name = "ds",
##D                              target_column_name = "Y1",
##D                              mining_function = "regression")
##D 
##D svm2 <- RODM_apply_model(database = DB,    # Predict training data
##D                          data_table_name = "ds", 
##D                          model_name = "SVM_MODEL",
##D                          supplemental_cols = "X1")
##D 
##D plot(X1, Y1, pch=20, col="blue")
##D points(x=svm2$model.apply.results[, "X1"], 
##D        svm2$model.apply.results[, "PREDICTION"], pch=20, col="red")
##D legend(-4, -1.5, legend = c("actual", "SVM regression"), pch = c(20, 20), col = c("blue", "red"),
##D                 pt.bg =  c("blue", "red"), cex = 1.20, pt.cex=1.5, bty="n")
##D 
##D RODM_drop_model(DB, "SVM_MODEL")       # Drop the model
##D RODM_drop_dbms_table(DB, "ds")         # Drop the database table
## End(Not run)

### Anomaly detection
# Finding outliers in a 2D-dimensional discrete distribution of points
## Not run: 
##D X1 <- c(rnorm(200, mean = 2, sd = 1), rnorm(300, mean = 8, sd = 2))
##D Y1 <- c(rnorm(200, mean = 2, sd = 1.5), rnorm(300, mean = 8, sd = 1.5))
##D ds <- data.frame(cbind(X1, Y1)) 
##D RODM_create_dbms_table(DB, "ds")   # Push the table to the database
##D 
##D svm <- RODM_create_svm_model(database = DB,    # Create ODM SVM anomaly detection model
##D                              data_table_name = "ds", 
##D                              target_column_name = NULL, 
##D                              model_name = "SVM_MODEL",
##D                              mining_function = "anomaly_detection")
##D 
##D svm2 <- RODM_apply_model(database = DB,    # Predict training data
##D                          data_table_name = "ds", 
##D                          model_name = "SVM_MODEL",
##D                          supplemental_cols = c("X1","Y1"))
##D 
##D plot(X1, Y1, pch=20, col="white")
##D col <- ifelse(svm2$model.apply.results[, "PREDICTION"] == 1, "green", "red")
##D for (i in 1:500) points(x=svm2$model.apply.results[i, "X1"], 
##D                         y=svm2$model.apply.results[i, "Y1"], 
##D                         col = col[i], pch=20)
##D legend(8, 2, legend = c("typical", "anomaly"), pch = c(20, 20), col = c("green", "red"),
##D                 pt.bg =  c("green", "red"), cex = 1.20, pt.cex=1.5, bty="n")
##D 
##D RODM_drop_model(DB, "SVM_MODEL")       # Drop the model
##D RODM_drop_dbms_table(DB, "ds")         # Drop the database table
##D 
##D RODM_close_dbms_connection(DB)
## End(Not run)



