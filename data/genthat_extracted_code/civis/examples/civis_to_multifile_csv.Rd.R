library(civis)


### Name: civis_to_multifile_csv
### Title: Split a Redshift table into multiple CSV parts on S3
### Aliases: civis_to_multifile_csv

### ** Examples

## Not run: 
##D # Download a table into multiple csv parts
##D sql <- "SELECT * FROM schema.table"
##D database <- "important_database"
##D manifest <- civis_to_multifile_csv(sql=sql, database=database)
##D files <- lapply(manifest[["entries"]], function(x) {
##D   download_civis(x$id, x$name)
##D   x$name
##D })
## End(Not run)



