library(civis)


### Name: download_civis
### Title: Download a table or a file from the Civis Platform to local disk
### Aliases: download_civis download_civis.character download_civis.sql
###   download_civis.numeric

### ** Examples

## Not run: 
##D # Download all columns in a single table into a CSV
##D download_civis("schema.table", database = "my_database",
##D                file = "~/Downloads/my_table.csv")
##D 
##D # Download data from a SQL select statement (READ ONLY) into a CSV
##D query <- sql("SELECT * FROM table JOIN other_table USING id WHERE var1 < 23")
##D download_civis(query, database = "my_database",
##D                file = "~/Downloads/my_table.csv")
##D 
##D # Set a default database
##D options(civis.default_db = "my_database")
##D 
##D # Download any file from the files endpoint.
##D file_id <- write_civis_file(df)
##D download_civis(file_id, file = "df.rds", progress = TRUE)
##D df2 <- readRDS("df.rds")
##D identical(df, df2)
## End(Not run)



