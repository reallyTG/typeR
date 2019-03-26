library(backports)


### Name: file.info
### Title: Backport of 'file.info' for R < 3.2.0
### Aliases: file.info
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_file.info = getFromNamespace("file.info", "backports")

bp_file.info(file.path(R.home(), "COPYING"), extra_cols = FALSE)



