library(withr)


### Name: with_db_connection
### Title: DBMS Connections which disconnect themselves.
### Aliases: with_db_connection local_db_connection

### ** Examples

db <- tempfile()
with_db_connection(
  list(con = DBI::dbConnect(RSQLite::SQLite(), db)), {
    DBI::dbWriteTable(con, "mtcars", mtcars)
})

head_db_table <- function(...) {
  con <- local_db_connection(DBI::dbConnect(RSQLite::SQLite(), db))
  head(DBI::dbReadTable(con, "mtcars"), ...)
}
head_db_table()
unlink(db)



