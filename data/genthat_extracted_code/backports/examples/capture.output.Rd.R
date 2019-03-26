library(backports)


### Name: capture.output
### Title: Backport of 'capture.output' for R < 3.3.0
### Aliases: capture.output
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_capture.output <- getFromNamespace("capture.output", "backports")

captured <- bp_capture.output({ message("hi") }, type = "message")
str(captured)



