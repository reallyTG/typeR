library(rlang)


### Name: sym
### Title: Create a symbol or list of symbols
### Aliases: sym syms

### ** Examples

# The empty string returns the missing argument:
sym("")

# This way sym() and as_string() are inverse of each other:
as_string(missing_arg())
sym(as_string(missing_arg()))



