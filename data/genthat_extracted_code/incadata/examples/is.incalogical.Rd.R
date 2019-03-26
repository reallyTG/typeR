library(incadata)


### Name: is.incalogical
### Title: Coerce to logical if value is logical according to INCA
### Aliases: is.incalogical incalogical2logical

### ** Examples

is.incalogical(c("", "", "True", ""))  # TRUE
is.incalogical(c("", "False", "", "")) # TRUE
is.incalogical(c("", "FALSE", "", "")) # FALSE
is.incalogical(logical(2)) # will be recognised as well



