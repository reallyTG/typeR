library(backports)


### Name: startsWith
### Title: Backport of startsWith for R < 3.3.0
### Aliases: startsWith
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_startsWith = getFromNamespace("startsWith", "backports")

bp_startsWith(c("aabb", "bbcc"), "bb")



