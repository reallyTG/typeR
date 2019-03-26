library(dbplyr)


### Name: sql_quote
### Title: Helper function for quoting sql elements.
### Aliases: sql_quote
### Keywords: internal

### ** Examples

sql_quote("abc", "'")
sql_quote("I've had a good day", "'")
sql_quote(c("abc", NA), "'")



