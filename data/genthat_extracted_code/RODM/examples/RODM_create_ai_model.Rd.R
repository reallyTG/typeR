library(RODM)


### Name: RODM_create_ai_model
### Title: Create an Attribute Importance (AI) model
### Aliases: RODM_create_ai_model

### ** Examples

# Determine attribute importance for survival in the sinking of the Titanic 
# based on pasenger's sex, age, class, etc.

## Not run: 
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid="rodm", pwd="rodm")
##D 
##D data(titanic3, package="PASWR")
##D db_titanic <- titanic3[,c("pclass", "survived", "sex", "age", "fare", "embarked")]
##D db_titanic[,"survived"] <- ifelse(db_titanic[,"survived"] == 1, "Yes", "No")
##D RODM_create_dbms_table(DB, "db_titanic")   # Push the table to the database
##D 
##D # Create the Oracle Data Mining Attribute Importance model
##D ai <- RODM_create_ai_model(
##D    database = DB,                      # Database ODBC connection
##D    data_table_name = "db_titanic",     # Database table containing the input dataset
##D    target_column_name = "survived",    # Target column name in data_table_name
##D    model_name = "TITANIC_AI_MODEL")    # Oracle Data Mining model name to create
##D 
##D attribute.importance <- ai$ai.importance
##D ai.vals <- as.vector(attribute.importance[,3])
##D names(ai.vals) <- as.vector(attribute.importance[,1])
##D 
##D #windows(height=8, width=12)
##D barplot(ai.vals, main="Relative survival importance of Titanic dataset attributes",
##D         ylab = "Relative Importance", xlab = "Attribute", cex.names=0.7)
##D 
##D ai        # look at the model details
##D 
##D RODM_drop_model(DB, "TITANIC_AI_MODEL")    # Drop the model
##D RODM_drop_dbms_table(DB, "db_titanic")     # Drop the database table
##D 
##D RODM_close_dbms_connection(DB)
## End(Not run)



