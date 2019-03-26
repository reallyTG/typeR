library(RODM)


### Name: RODM_create_assoc_model
### Title: Create an Association Rules model
### Aliases: RODM_create_assoc_model

### ** Examples

## Not run: 
##D DB <- RODM_open_dbms_connection(dsn="orcl11g", uid= "rodm", pwd = "rodm")
##D 
##D data(satfruit, package="PASWR")
##D ards <- satfruit[,c("WH", "BA", "NAR", "COR", "SF", "VI", "PS", "ES", "AF", "CO", "AR", "AL", "OL")]  # Select subset of attributes
##D ards[,] <- ifelse(ards[,] == 0, NA, "YES")   # make it sparse, as required by ODM
##D n.rows <- length(ards[,1])           # Number of rows
##D row.id <- matrix(seq(1, n.rows), nrow=n.rows, ncol=1, dimnames= list(NULL, c("ROW_ID"))) # Row id
##D ards <- cbind(row.id, ards)          # Add row id to dataset 
##D RODM_create_dbms_table(DB, "ards")   # Push the training table to the database
##D 
##D # Build the association rules model
##D ar <- RODM_create_assoc_model(
##D  database = DB, 
##D  data_table_name = "ards", 
##D  case_id_column_name = "ROW_ID")
##D 
##D # Inspect the contents of ar to find the rules and itemsets
##D 
##D RODM_drop_model(DB, "AR_MODEL") 
##D RODM_drop_dbms_table(DB, "ards") 
##D 
##D RODM_close_dbms_connection(DB)
## End(Not run)



