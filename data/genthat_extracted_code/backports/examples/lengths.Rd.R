library(backports)


### Name: lengths
### Title: Backport of lengths for R < 3.2.0
### Aliases: lengths
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_lengths = getFromNamespace("lengths", "backports")

bp_lengths(list(1:3, 2))



