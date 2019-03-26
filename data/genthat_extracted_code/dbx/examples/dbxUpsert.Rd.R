library(dbx)


### Name: dbxUpsert
### Title: Upsert records
### Aliases: dbxUpsert

### ** Examples

## Not run: 
##D 
##D db <- dbxConnect(adapter="postgres", dbname="dbx")
##D table <- "forecasts"
##D DBI::dbCreateTable(db, table, data.frame(id=1:3, temperature=20:22))
##D 
##D records <- data.frame(id=c(3, 4), temperature=c(20, 25))
##D dbxUpsert(db, table, records, where_cols=c("id"))
## End(Not run)



