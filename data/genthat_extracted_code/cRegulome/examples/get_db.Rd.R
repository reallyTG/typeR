library(cRegulome)


### Name: get_db
### Title: Get cRegulome.db file
### Aliases: get_db

### ** Examples

## Not run: 
##D # download a test set of the database
##D get_db(test = TRUE)
##D 
##D # download the full database file
##D get_db(test = FALSE)
## End(Not run)

# load the test db file from shipped with the pacakge
db_file <- system.file("extdata", "cRegulome.db", package = "cRegulome")
file.info(db_file)




