library(DBI)


### Name: sqlParseVariables
### Title: Parse interpolated variables from SQL.
### Aliases: sqlParseVariables sqlCommentSpec sqlQuoteSpec
###   sqlParseVariablesImpl
### Keywords: internal

### ** Examples

# Use [] for quoting and no comments
sqlParseVariablesImpl("[?a]",
  list(sqlQuoteSpec("[", "]", "\\", FALSE)),
  list()
)

# Standard quotes, use # for commenting
sqlParseVariablesImpl("# ?a\n?b",
  list(sqlQuoteSpec("'", "'"), sqlQuoteSpec('"', '"')),
  list(sqlCommentSpec("#", "\n", FALSE))
)



