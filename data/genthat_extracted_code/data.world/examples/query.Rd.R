library(data.world)


### Name: query
### Title: Execute a query on data.world.
### Aliases: query query.qry_sql query.qry_sparql

### ** Examples

## Not run: 
##D   sql_stmt <- data.world::qry_sql("SELECT * FROM Tables")
##D   query_results_df <- data.world::query(
##D     sql_stmt, "jonloyens/an-intro-to-dataworld-dataset")
## End(Not run)
## Not run: 
##D   sparql_stmt <- data.world::qry_sparql("SELECT ?s ?p ?o
##D                                          WHERE {
##D                                            ?s ?p ?o.
##D                                          }")
##D   query_results_df <- data.world::query(
##D     sparql_stmt, "jonloyens/an-intro-to-dataworld-dataset")
## End(Not run)



