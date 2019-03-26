library(DBI)


### Name: dbGetQuery
### Title: Send query, retrieve results and then clear result set
### Aliases: dbGetQuery

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
dbGetQuery(con, "SELECT * FROM mtcars")
dbGetQuery(con, "SELECT * FROM mtcars", n = 6)

# Pass values using the param argument:
# (This query runs eight times, once for each different
# parameter. The resulting rows are combined into a single
# data frame.)
dbGetQuery(con, "SELECT COUNT(*) FROM mtcars WHERE cyl = ?", param = list(1:8))

dbDisconnect(con)



