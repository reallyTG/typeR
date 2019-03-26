library(backports)


### Name: isFALSE
### Title: Backport of isFALSE for R < 3.4.2
### Aliases: isFALSE
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_isFALSE = getFromNamespace("isFALSE", "backports")

bp_isFALSE(FALSE)
bp_isFALSE(iris)



