library(RODM)


### Name: RODM_list_dbms_models
### Title: List Oracle Data Mining models
### Aliases: RODM_list_dbms_models

### ** Examples

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
##D RODM_create_dbms_table(DB, "titanic_train")   # Push the training table to the database
##D RODM_create_dbms_table(DB, "titanic_test")    # Push the testing table to the database
##D 
##D # Create an ODM Naive Bayes model
##D nb <- RODM_create_nb_model(
##D    database = DB,                     # Database ODBC channel identifier
##D    model_name = "titanic_nb_model",   # ODM model name
##D    data_table_name = "titanic_train", # (in quotes) Data frame or database table containing the input dataset
##D    target_column_name = "survived")   # Target column name in data_table_name		
##D 
##D # Create an ODM Attribute Importance model
##D ai <- RODM_create_ai_model(
##D    database = DB,                     # Database ODBC channel identifier
##D    model_name = "titanic_ai_model",   # ODM model name
##D    data_table_name = "titanic_train", # (in quotes) Data frame or database table containing the input dataset
##D    target_column_name = "survived")   # Target column name in data_table_name		
##D 
##D # List the models
##D mlist <- RODM_list_dbms_models(DB)
##D mlist
##D 
##D RODM_drop_model(DB, "titanic_nb_model")
##D RODM_drop_model(DB, "titanic_ai_model")
##D RODM_drop_dbms_table(DB, "titanic_train")
##D RODM_drop_dbms_table(DB, "titanic_test")
##D 
##D RODM_close_dbms_connection(DB)
## End(Not run)



