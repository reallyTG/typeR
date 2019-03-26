library(civis)


### Name: fetch_logs
### Title: Fetch job logs from the Civis Platform
### Aliases: fetch_logs

### ** Examples

## Not run: 
##D m <- civis_ml_fetch_existing(123)
##D fetch_logs(m)
##D 
##D import <- write_civis(iris, "scratch.mytest")
##D fetch_logs(import)
##D 
##D query_run <- query_civis(123)
##D fetch_logs(query_run)
##D 
##D e <- tryCatch(read_civis("asdf;"), error = function(e) e)
##D fetch_logs(e)
## End(Not run)




