library(backports)


### Name: URLencode
### Title: Backport of URLencode for R < 3.2.0
### Aliases: URLencode
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_URLencode = getFromNamespace("URLencode", "backports")

URLdecode(z <- "ab%20cd")
c(bp_URLencode(z), bp_URLencode(z, repeated = TRUE))



