library(elasticsearchr)


### Name: valid_connection
### Title: Validate healthy Elasticsearch connection.
### Aliases: valid_connection

### ** Examples

## Not run: 
##D url <- "http://localhost:9200"
##D valid_connection(url)
##D # TRUE
##D 
##D url <- "http://localhost:9201"
##D valid_connection(url)
##D #  Error: Failed to connect to localhost port 9201: Connection refused
## End(Not run)



