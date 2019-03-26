library(MonetDB.R)


### Name: MonetDB.R
### Title: DBI database connector for MonetDB
### Aliases: MonetDB.R-package MonetDB.R MonetDBR MonetDB MonetR
### Keywords: interface

### ** Examples

## Not run: 
##D library(DBI)
##D conn <- dbConnect(MonetDB.R::MonetDB(), dbname = "demo")
##D dbWriteTable(conn, "iris", iris)
##D dbListTables(conn)
##D dbGetQuery(conn, "SELECT COUNT(*) FROM iris")
##D d <- dbReadTable(conn, "iris")
## End(Not run)


