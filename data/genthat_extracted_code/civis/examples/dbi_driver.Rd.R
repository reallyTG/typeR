library(civis)


### Name: dbi_driver
### Title: Civis DBI driver
### Aliases: dbi_driver

### ** Examples

## Not run: 
##D con <- DBI::dbConnect(dbi_driver(), database = "redshift-general")
##D rs <- DBI::dbSendQuery(con, "SELECT 1")
##D dbFetch(rs)
## End(Not run)



