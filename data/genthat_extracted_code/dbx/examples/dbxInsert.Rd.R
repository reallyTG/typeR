library(dbx)


### Name: dbxInsert
### Title: Insert records
### Aliases: dbxInsert

### ** Examples

db <- dbxConnect(adapter="sqlite", dbname=":memory:")
table <- "forecasts"
DBI::dbCreateTable(db, table, data.frame(id=1:3, temperature=20:22))

records <- data.frame(temperature=c(32, 25))
dbxInsert(db, table, records)



