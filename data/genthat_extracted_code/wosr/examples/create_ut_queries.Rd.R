library(wosr)


### Name: create_ut_queries
### Title: Create a vector of UT-based queries
### Aliases: create_ut_queries

### ** Examples

## Not run: 
##D 
##D data <- pull_wos('TS = ("animal welfare") AND PY = (2002-2003)')
##D queries <- create_ut_queries(data$publication$ut)
##D pull_wos_apply(queries)
## End(Not run)



