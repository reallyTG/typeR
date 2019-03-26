library(DBI)


### Name: sqlData
### Title: Convert a data frame into form suitable for upload to an SQL
###   database
### Aliases: sqlData

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

sqlData(con, head(iris))
sqlData(con, head(mtcars))

dbDisconnect(con)



