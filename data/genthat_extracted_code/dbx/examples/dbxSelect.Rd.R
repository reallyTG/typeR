library(dbx)


### Name: dbxSelect
### Title: Select records
### Aliases: dbxSelect

### ** Examples

db <- dbxConnect(adapter="sqlite", dbname=":memory:")
DBI::dbCreateTable(db, "forecasts", data.frame(id=1:3, temperature=20:22))

dbxSelect(db, "SELECT * FROM forecasts")

dbxSelect(db, "SELECT * FROM forecasts WHERE id = ?", params=list(1))

dbxSelect(db, "SELECT * FROM forecasts WHERE id IN (?)", params=list(1:3))



