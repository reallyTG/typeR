library(backports)


### Name: ...length
### Title: Backport of ...length for R < 3.4.2
### Aliases: ...length
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_...length = getFromNamespace("...length", "backports")

foo = function(...) bp_...length()
foo(1, 2, 3)



