library(backports)


### Name: trimws
### Title: Backport of trimws for R < 3.3.0
### Aliases: trimws
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_trimws = getFromNamespace("trimws", "backports")
bp_trimws(c("  a  ", "b  ", "  c"))

bp_trimws(c("  a  ", "b  ", "  c"), which = "left")



