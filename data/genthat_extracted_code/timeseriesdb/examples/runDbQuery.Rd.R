library(timeseriesdb)


### Name: runDbQuery
### Title: Run SELECT query
### Aliases: runDbQuery

### ** Examples

# There's no connection, so this returns a proper error message.
## No test: 
out_obj <- runDbQuery(bogus_connection,"SELECT * FROM some_table") 
attributes(out_obj)
## End(No test)



