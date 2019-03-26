library(backports)


### Name: hasName
### Title: Backport of hasName for R < 3.4.0
### Aliases: hasName
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_hasName = getFromNamespace("hasName", "backports")

bp_hasName(list(a = 1, b = 2), c("a", "b", "c"))



