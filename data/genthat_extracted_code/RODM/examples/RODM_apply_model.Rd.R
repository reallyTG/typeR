library(RODM)


### Name: RODM_apply_model
### Title: Apply an Oracle Data Mining model
### Aliases: RODM_apply_model
### Keywords: classif cluster

### ** Examples


## Not run: 
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid= "rodm", pwd = "rodm")
##D 
##D ### Classification
##D 
##D # Predicting survival in the sinking of the Titanic based on pasenger's sex, age, class, etc.
##D 
##D 
##D data(titanic3, package="PASWR")                                             # Load survival data from Titanic
##D ds <- titanic3[,c("pclass", "survived", "sex", "age", "fare", "embarked")]  # Select subset of attributes
##D ds[,"survived"] <- ifelse(ds[,"survived"] == 1, "Yes", "No")                # Rename target values
##D n.rows <- length(ds[,1])                                                    # Number of rows
##D random_sample <- sample(1:n.rows, ceiling(n.rows/2))   # Split dataset randomly in train/test subsets
##D titanic_train <- ds[random_sample,]                         # Training set
##D titanic_test <-  ds[setdiff(1:n.rows, random_sample),]      # Test set
##D RODM_create_dbms_table(DB, "titanic_train")   # Push the training table to the database
##D RODM_create_dbms_table(DB, "titanic_test")    # Push the testing table to the database
##D svm <- RODM_create_svm_model(database = DB,    # Create ODM SVM classification model
##D                              data_table_name = "titanic_train", 
##D                              target_column_name = "survived", 
##D                              model_name = "SVM_MODEL",
##D                              mining_function = "classification")
##D 
##D # Apply the SVM classification model to test data.
##D svm2 <- RODM_apply_model(database = DB,    # Predict test data
##D                          data_table_name = "titanic_test", 
##D                          model_name = "SVM_MODEL",
##D                          supplemental_cols = "survived")
##D 
##D print(svm2$model.apply.results[1:10,])                                # Print example of prediction results
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
##D RODM_drop_dbms_table(DB, "titanic_train")   # Drop the training table in the database
##D RODM_drop_dbms_table(DB, "titanic_test")    # Drop the testing table in the database
## End(Not run)

### Regression

# Aproximating a one-dimensional non-linear function

## Not run: 
##D X1 <- 10 * runif(500) - 5 
##D Y1 <- X1*cos(X1) + 2*runif(500) 
##D ds <- data.frame(cbind(X1, Y1)) 
##D RODM_create_dbms_table(DB, "ds")   # Push the table to the database
##D svm <- RODM_create_svm_model(database = DB,    # Create ODM SVM regression model
##D                              data_table_name = "ds", 
##D                              target_column_name = "Y1", 
##D                              model_name = "SVM_MODEL",
##D                              mining_function = "regression")
##D 
##D # Apply the SVM regression model to test data.
##D svm2 <- RODM_apply_model(database = DB,    # Predict training data
##D                          data_table_name = "ds", 
##D                          model_name = "SVM_MODEL",
##D                          supplemental_cols = "X1")
##D 
##D plot(X1, Y1, pch=20, col="blue")
##D points(x=svm2$model.apply.results[, "X1"], svm2$model.apply.results[, "PREDICTION"], pch=20, col="red")
##D legend(-4, -1.5, legend = c("actual", "SVM regression"), pch = c(20, 20), col = c("blue", "red"),
##D                 pt.bg =  c("blue", "red"), cex = 1.20, pt.cex=1.5, bty="n")
##D 
##D RODM_drop_model(DB, "SVM_MODEL")            # Drop the model
##D RODM_drop_dbms_table(DB, "ds")              # Drop the database table
## End(Not run)

### Anomaly detection

# Finding outliers in a 2D-dimensional discrete distribution of points

## Not run: 
##D X1 <- c(rnorm(200, mean = 2, sd = 1), rnorm(300, mean = 8, sd = 2))
##D Y1 <- c(rnorm(200, mean = 2, sd = 1.5), rnorm(300, mean = 8, sd = 1.5))
##D ds <- data.frame(cbind(X1, Y1)) 
##D RODM_create_dbms_table(DB, "ds")   # Push the table to the database
##D svm <- RODM_create_svm_model(database = DB,    # Create ODM SVM anomaly detection model
##D                              data_table_name = "ds", 
##D                              target_column_name = NULL, 
##D                              model_name = "SVM_MODEL",
##D                              mining_function = "anomaly_detection")
##D 
##D # Apply the SVM anomaly detection model to data.
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
##D RODM_drop_model(DB, "SVM_MODEL")            # Drop the model
##D RODM_drop_dbms_table(DB, "ds")    # Drop the database table
## End(Not run)

### Clustering 

# Clustering a 2D multi-Gaussian distribution of points into clusters

## Not run: 
##D set.seed(seed=6218945)
##D X1 <- c(rnorm(100, mean = 2, sd = 1), rnorm(100, mean = 8, sd = 2), rnorm(100, mean = 5, sd = 0.6),
##D         rnorm(100, mean = 4, sd = 1), rnorm(100, mean = 10, sd = 1)) # Create and merge 5 Gaussian distributions
##D Y1 <- c(rnorm(100, mean = 1, sd = 2), rnorm(100, mean = 4, sd = 1.5), rnorm(100, mean = 6, sd = 0.5),
##D         rnorm(100, mean = 3, sd = 0.2), rnorm(100, mean = 2, sd = 1))
##D ds <- data.frame(cbind(X1, Y1)) 
##D n.rows <- length(ds[,1])                                                    # Number of rows
##D row.id <- matrix(seq(1, n.rows), nrow=n.rows, ncol=1, dimnames= list(NULL, c("ROW_ID"))) # Row id
##D ds <- cbind(row.id, ds)                                                     # Add row id to dataset 
##D RODM_create_dbms_table(DB, "ds")   
##D km <- RODM_create_kmeans_model(
##D    database = DB,                  # database ODBC channel identifier
##D    data_table_name = "ds",         # data frame containing the input dataset
##D    case_id_column_name = "ROW_ID", # case id to enable assignments during build
##D    num_clusters = 5)
##D 
##D # Apply the K-Means clustering model to data.
##D km2 <- RODM_apply_model(
##D    database = DB,                  # database ODBC channel identifier
##D    data_table_name = "ds",         # data frame containing the input dataset
##D    model_name = "KM_MODEL",
##D    supplemental_cols = c("X1","Y1"))
##D 
##D x1a <- km2$model.apply.results[, "X1"]
##D y1a <- km2$model.apply.results[, "Y1"]
##D clu <- km2$model.apply.results[, "CLUSTER_ID"]
##D c.numbers <- unique(as.numeric(clu))
##D c.assign <- match(clu, c.numbers)
##D color.map <- c("blue", "green", "red", "orange", "purple")
##D color <- color.map[c.assign]
##D nf <- layout(matrix(c(1, 2), 1, 2, byrow=T), widths = c(1, 1), heights = 1, respect = FALSE)
##D plot(x1a, y1a, pch=20, col=1, xlab="X1", ylab="Y1", main="Original Data Points")
##D plot(x1a, y1a, pch=20, type = "n", xlab="X1", ylab="Y1", main="After kmeans clustering")
##D for (i in 1:n.rows) {
##D    points(x1a[i], y1a[i], col= color[i], pch=20)
##D }   
##D legend(5, -0.5, legend=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5"), pch = rep(20, 5), 
##D        col = color.map, pt.bg = color.map, cex = 0.8, pt.cex=1, bty="n")
##D 
##D RODM_drop_model(DB, "KM_MODEL")         # Drop the model
##D RODM_drop_dbms_table(DB, "ds")          # Drop the database table
##D 
##D 
##D RODM_close_dbms_connection(DB)
## End(Not run)



