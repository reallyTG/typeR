library(backports)


### Name: anyNA
### Title: Backport of anyNA for R versions < 3.2.0.
### Aliases: anyNA
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_anyNA = getFromNamespace("anyNA", "backports")

bp_anyNA(letters)



