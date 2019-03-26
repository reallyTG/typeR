library(civis)


### Name: query_civis_file
### Title: Export results from a query to S3 and return a file id.
### Aliases: query_civis_file query_civis_file.character
###   query_civis_file.sql query_civis_file.numeric

### ** Examples

## Not run: 
##D id <- query_civis_file("schema.tablename", database = "my_database")
##D df <- read_civis(id, using = read.csv)
##D 
##D query <- sql("SELECT * FROM table JOIN other_table USING id WHERE var1 < 23")
##D id <- query_civis_file(query)
##D df <- read_civis(id, using = read.csv)
##D 
##D id <- query_civis_file(query_id)
##D df <- read_civis(id, using = read.csv)
## End(Not run)



