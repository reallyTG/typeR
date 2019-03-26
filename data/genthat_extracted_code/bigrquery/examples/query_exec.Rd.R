library(bigrquery)


### Name: query_exec
### Title: Run a asynchronous query and retrieve results deprecated
### Aliases: query_exec
### Keywords: internal

### ** Examples

## Not run: 
##D project <- bq_test_project() # put your project ID here
##D sql <- "SELECT year, month, day, weight_pounds FROM [publicdata:samples.natality] LIMIT 5"
##D query_exec(sql, project = project)
##D # Put the results in a table you own (which uses project by default)
##D query_exec(sql, project = project, destination_table = "my_dataset.results")
##D # Use a default dataset for the query
##D sql <- "SELECT year, month, day, weight_pounds FROM natality LIMIT 5"
##D query_exec(sql, project = project, default_dataset = "publicdata:samples")
## End(Not run)



