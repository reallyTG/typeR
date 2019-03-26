library(backports)


### Name: endsWith
### Title: Backport of endsWith for R < 3.3.0
### Aliases: endsWith
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_endsWith = getFromNamespace("endsWith", "backports")

bp_endsWith(c("aabb", "bbcc"), "bb")



