library(backports)


### Name: get0
### Title: Backport of get0 for R < 3.2.0
### Aliases: get0
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_get0 = getFromNamespace("get0", "backports")

bp_get0("a")
bp_get0("a", ifnotfound = 0)

foo = 12
bp_get0("foo")



