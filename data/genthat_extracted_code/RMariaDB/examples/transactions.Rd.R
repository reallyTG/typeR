library(RMariaDB)


### Name: transactions
### Title: DBMS Transaction Management
### Aliases: transactions dbBegin,MariaDBConnection-method
###   dbCommit,MariaDBConnection-method dbRollback,MariaDBConnection-method

### ** Examples

if (mariadbHasDefault()) {
con <- dbConnect(RMariaDB::MariaDB(), dbname = "test")
df <- data.frame(id = 1:5)

dbWriteTable(con, "df", df, temporary = TRUE)
dbBegin(con)
dbExecute(con, "UPDATE df SET id = id * 10")
dbGetQuery(con, "SELECT id FROM df")
dbRollback(con)

dbGetQuery(con, "SELECT id FROM df")

dbDisconnect(con)
}



