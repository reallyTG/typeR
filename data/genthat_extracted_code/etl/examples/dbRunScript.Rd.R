library(etl)


### Name: dbRunScript
### Title: Execute an SQL script
### Aliases: dbRunScript

### ** Examples

sql <- "SHOW TABLES; SELECT 1+1 as Two;"
sql2 <- system.file("sql", "mtcars.mysql", package = "etl")
sql3 <- "SELECT * FROM user WHERE user = 'mysql';SELECT * FROM user WHERE 't' = 't';"

if (require(RSQLite)) {
  con <- dbConnect(RSQLite::SQLite())
  dbRunScript(con, "SELECT 1+1 as Two; VACUUM; ANALYZE;")
}
## Not run: 
##D if (require(RMySQL)) {
##D  con <- dbConnect(RMySQL::MySQL(), default.file = path.expand("~/.my.cnf"),
##D    group = "client",user = NULL, password = NULL, dbname = "mysql", host = "127.0.0.1")
##D  dbRunScript(con, script = sql)
##D  dbRunScript(con, script = sql2)
##D  dbRunScript(con, script = sql3)
##D  dbDisconnect(con)
##D }
## End(Not run)




