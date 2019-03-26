library(backports)


### Name: warningCondition
### Title: Backport of warningCondition and errorCondition for R < 3.6.0
### Aliases: warningCondition errorCondition
### Keywords: internal

### ** Examples

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_warningCondition = getFromNamespace("warningCondition", "backports")
bp_warningCondition("package backports not found")



