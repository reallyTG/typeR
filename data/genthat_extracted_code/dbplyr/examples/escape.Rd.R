library(dbplyr)


### Name: escape
### Title: Escape/quote a string.
### Aliases: escape sql_vector

### ** Examples

# Doubles vs. integers
escape(1:5)
escape(c(1, 5.4))

# String vs known sql vs. sql identifier
escape("X")
escape(sql("X"))
escape(ident("X"))

# Escaping is idempotent
escape("X")
escape(escape("X"))
escape(escape(escape("X")))



