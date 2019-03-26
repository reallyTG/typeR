library(RODM)


### Name: RODM_drop_model
### Title: Drop an Oracle Data Mining model
### Aliases: RODM_drop_model

### ** Examples

## Not run: 
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid="rodm", pwd="rodm")
##D data(titanic3, package="PASWR")
##D db_titanic <- titanic3[,c("pclass", "survived", "sex", "age", "fare", "embarked")]
##D db_titanic[,"survived"] <- ifelse(db_titanic[,"survived"] == 1, "Yes", "No")
##D RODM_create_dbms_table(DB, "db_titanic")   # Push the table to the database
##D ai <- RODM_create_ai_model(
##D    database = DB,                      # Database ODBC connection
##D    data_table_name = "db_titanic",     # Database table containing the input dataset
##D    target_column_name = "survived",    # Target column name in data_table_name
##D    model_name = "TITANIC_AI_MODEL")    # Oracle Data Mining model name to create
##D 
##D # Drop the model that was just created
##D RODM_drop_model(DB, "TITANIC_AI_MODEL")
##D 
##D RODM_drop_dbms_table(DB, "db_titanic")     # Drop the database table
##D RODM_close_dbms_connection(DB)
## End(Not run)



