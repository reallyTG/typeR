library(RMariaDB)


### Name: mariadb-quoting
### Title: Quote MariaDB strings and identifiers.
### Aliases: mariadb-quoting
###   dbQuoteIdentifier,MariaDBConnection,character-method
###   dbQuoteIdentifier,MariaDBConnection,SQL-method
###   dbQuoteIdentifier,MariaDBConnection,Id-method
###   dbUnquoteIdentifier,MariaDBConnection,SQL-method
###   dbQuoteString,MariaDBConnection,character-method
###   dbQuoteString,MariaDBConnection,SQL-method
### Keywords: internal

### ** Examples

if (mariadbHasDefault()) {
  con <- dbConnect(RMariaDB::MariaDB())
  dbQuoteIdentifier(con, c("a b", "a`b"))
  dbQuoteString(con, c("a b", "a'b"))
  dbDisconnect(con)
}



