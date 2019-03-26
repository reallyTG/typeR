library(RRedshiftSQL)


### Name: RedshiftSQL
### Title: Instantiate a Redshift client
### Aliases: RedshiftSQL

### ** Examples

## Not run: 
##D con <- dbConnect(RedshiftSQL(), user="u", password = "p", host="h", dbname="n", port = "5439")
##D query <- dbSendQuery(con, "SELECT * FROM table")
## End(Not run)



