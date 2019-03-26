library(dbx)


### Name: dbxConnect
### Title: Create a database connection
### Aliases: dbxConnect

### ** Examples

# SQLite
db <- dbxConnect(adapter="sqlite", dbname=":memory:")

## Not run: 
##D 
##D # Postgres
##D db <- dbxConnect(adapter="postgres", dbname="mydb")
##D 
##D # MySQL
##D db <- dbxConnect(adapter="mysql", dbname="mydb")
##D 
##D # Others
##D db <- dbxConnect(adapter=odbc(), database="mydb")
## End(Not run)



