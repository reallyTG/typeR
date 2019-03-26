library(dbplyr)


### Name: ident
### Title: Flag a character vector as SQL identifiers
### Aliases: ident ident_q is.ident

### ** Examples

# SQL92 quotes strings with '
escape("x")

# And identifiers with "
ident("x")
escape(ident("x"))

# You can supply multiple inputs
ident(a = "x", b = "y")
ident_q(a = "x", b = "y")



