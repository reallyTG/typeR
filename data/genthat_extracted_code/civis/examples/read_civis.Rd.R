library(civis)


### Name: read_civis
### Title: Read a table or file from the Civis Platform as a data frame
### Aliases: read_civis read_civis.numeric read_civis.character
###   read_civis.sql

### ** Examples

## Not run: 
##D # Read all columns in a single table
##D df <- read_civis("schema.my_table", database = "my_database")
##D 
##D # Read data from a SQL select statement (READ ONLY)
##D query <- sql("SELECT * FROM table JOIN other_table USING id WHERE var1 < 23")
##D df <- read_civis(query, database = "my_database")
##D 
##D # Read an R object from the files endpoint.
##D id <- write_civis_file(df)
##D df <- read_civis(id)
##D 
##D # Read a text file or csv from the files endpoint.
##D id <- write_civis_file("my_csv.csv")
##D df <- read_civis(id, using = read.csv)
##D 
##D # Gracefully handle when read_civis.sql returns no rows
##D query <- sql("SELECT * FROM table WHERE 1 = 2")
##D mean_x <- tryCatch({
##D   df <- read_civis(query, database = "my_database")
##D   mean(df$x)
##D }, empty_result_error = function(e) {
##D    NA
##D })
## End(Not run)



