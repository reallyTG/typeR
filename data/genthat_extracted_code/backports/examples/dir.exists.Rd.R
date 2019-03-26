library(backports)


### Name: dir.exists
### Title: Backport of dir.exists for R < 3.2.0
### Aliases: dir.exists
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_dir.exists = getFromNamespace("dir.exists", "backports")

bp_dir.exists(tempdir())



