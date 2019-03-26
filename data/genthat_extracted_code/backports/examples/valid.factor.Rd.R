library(backports)


### Name: .valid.factor
### Title: Backport of .valid.factor for R < 3.4.0
### Aliases: .valid.factor
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_.valid_factor = getFromNamespace(".valid.factor", "backports")
bp_.valid_factor(factor(letters[1:3]))



