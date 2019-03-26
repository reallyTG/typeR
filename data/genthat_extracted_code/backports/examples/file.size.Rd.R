library(backports)


### Name: file.mode
### Title: Backports of wrappers around 'file.info' for R < 3.2.0
### Aliases: file.mode file.mtime file.size
### Keywords: internal

### ** Examples

# get functions from namespace instead of possibly getting
# implementations shipped with recent R versions:
bp_file.size = getFromNamespace("file.size", "backports")
bp_file.mode = getFromNamespace("file.size", "backports")
bp_file.mtime = getFromNamespace("file.size", "backports")

fn = file.path(R.home(), "COPYING")
bp_file.size(fn)
bp_file.mode(fn)
bp_file.size(fn)



