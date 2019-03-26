library(dbx)


### Name: dbxDelete
### Title: Delete records
### Aliases: dbxDelete

### ** Examples

db <- dbxConnect(adapter="sqlite", dbname=":memory:")
table <- "forecasts"
DBI::dbCreateTable(db, table, data.frame(id=1:3, temperature=20:22))

# Delete specific records
bad_records <- data.frame(id=c(1, 2))
dbxDelete(db, table, where=bad_records)

# Delete all records
dbxDelete(db, table)



