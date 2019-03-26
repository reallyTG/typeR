library(RPostgres)


### Name: quote
### Title: Quote postgres strings, identifiers, and literals
### Aliases: quote dbQuoteString,PqConnection,character-method
###   dbQuoteString,PqConnection,SQL-method
###   dbQuoteIdentifier,PqConnection,character-method
###   dbQuoteIdentifier,PqConnection,SQL-method
###   dbQuoteIdentifier,PqConnection,Id-method
###   dbUnquoteIdentifier,PqConnection,SQL-method dbQuoteLiteral
###   dbQuoteLiteral,PqConnection,logical-method
###   dbQuoteLiteral,PqConnection,integer-method
###   dbQuoteLiteral,PqConnection,numeric-method
###   dbQuoteLiteral,PqConnection,factor-method
###   dbQuoteLiteral,PqConnection,Date-method
###   dbQuoteLiteral,PqConnection,POSIXt-method
###   dbQuoteLiteral,PqConnection,difftime-method
###   dbQuoteLiteral,PqConnection,list-method
###   dbQuoteLiteral,PqConnection,blob-method

### ** Examples

# For running the examples on systems without PostgreSQL connection:
run <- postgresHasDefault()

library(DBI)
if (run) con <- dbConnect(RPostgres::Postgres())

x <- c("a", "b c", "d'e", "\\f")
if (run) dbQuoteString(con, x)
if (run) dbQuoteIdentifier(con, x)
if (run) dbDisconnect(con)



