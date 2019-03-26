library(DBI)


### Name: dbQuoteIdentifier
### Title: Quote identifiers
### Aliases: dbQuoteIdentifier

### ** Examples

# Quoting ensures that arbitrary input is safe for use in a query
name <- "Robert'); DROP TABLE Students;--"
dbQuoteIdentifier(ANSI(), name)

# SQL vectors are always passed through as is
var_name <- SQL("select")
var_name

dbQuoteIdentifier(ANSI(), var_name)

# This mechanism is used to prevent double escaping
dbQuoteIdentifier(ANSI(), dbQuoteIdentifier(ANSI(), name))



