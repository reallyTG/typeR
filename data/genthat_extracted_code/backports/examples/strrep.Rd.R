library(backports)


### Name: strrep
### Title: Backport of strrep for R < 3.3.0
### Aliases: strrep
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_strrep = getFromNamespace("strrep", "backports")

bp_strrep("-", 10)



