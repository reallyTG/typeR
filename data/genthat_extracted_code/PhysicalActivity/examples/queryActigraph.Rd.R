library(PhysicalActivity)


### Name: queryActigraph
### Title: Query ActiGraph File
### Aliases: queryActigraph

### ** Examples

## Not run: 
##D dat <- queryActigraph("actfile.agd", "SELECT * FROM data LIMIT 5")
##D 
##D queryActigraph("actfile.agd", "SELECT * FROM settings")
##D 
##D ## directly interface using DBI package
##D con <- DBI::dbConnect(RSQLite::SQLite(), "actfile.agd")
##D DBI::dbListTables(con)
##D DBI::dbDisconnect(con)
## End(Not run)



