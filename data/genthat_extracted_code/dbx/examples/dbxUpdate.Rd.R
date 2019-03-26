library(dbx)


### Name: dbxUpdate
### Title: Update records
### Aliases: dbxUpdate

### ** Examples

db <- dbxConnect(adapter="sqlite", dbname=":memory:")
table <- "forecasts"
DBI::dbCreateTable(db, table, data.frame(id=1:3, temperature=20:22))

records <- data.frame(id=c(1, 2), temperature=c(16, 13))
dbxUpdate(db, table, records, where_cols=c("id"))



