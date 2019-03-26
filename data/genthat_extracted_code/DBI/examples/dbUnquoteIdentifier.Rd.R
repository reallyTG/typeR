library(DBI)


### Name: dbUnquoteIdentifier
### Title: Unquote identifiers
### Aliases: dbUnquoteIdentifier

### ** Examples

# Unquoting allows to understand the structure of a
# possibly complex quoted identifier
dbUnquoteIdentifier(
  ANSI(),
  SQL(c('"Schema"."Table"', '"UnqualifiedTable"'))
)

# The returned object is always a list,
# also for Id objects
dbUnquoteIdentifier(
  ANSI(),
  Id(schema = "Schema", table = "Table")
)

# Quoting is the inverse operation to unquoting the elements
# of the returned list
dbQuoteIdentifier(
  ANSI(),
  dbUnquoteIdentifier(ANSI(), SQL("UnqualifiedTable"))[[1]]
)

dbQuoteIdentifier(
  ANSI(),
  dbUnquoteIdentifier(ANSI(), Id(schema = "Schema", table = "Table"))[[1]]
)



