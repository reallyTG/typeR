library(backports)


### Name: ...elt
### Title: Backport of ...elt for R < 3.4.2
### Aliases: ...elt
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_...elt = getFromNamespace("...elt", "backports")

foo = function(n, ...) bp_...elt(n)
foo(n = 2, "a", "b", "c")



