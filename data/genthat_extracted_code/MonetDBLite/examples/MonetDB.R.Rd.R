library(MonetDBLite)


### Name: MonetDB.R
### Title: DBI database connector for external MonetDB database
### Aliases: MonetDB.R MonetDBR MonetDB MonetR RMonetDB
### Keywords: interface

### ** Examples

## Not run: 
##D library(DBI)
##D con <- dbConnect(MonetDBLite::MonetDB.R(), dbname = "demo")
##D dbWriteTable(con, "iris", iris)
##D dbListTables(con)
##D dbGetQuery(con, "SELECT COUNT(*) FROM iris")
##D d <- dbReadTable(con, "iris")
## End(Not run)


