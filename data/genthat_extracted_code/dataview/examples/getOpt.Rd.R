library(dataview)


### Name: getOpt
### Title: Retrieves package options
### Aliases: default.options getOpt

### ** Examples

# This shows how to modify a column presented by whos.
# The new function only reports the size of non-S4 objects
# to improve execution time.
opt <- default.options()
opt$columns$bytes <- function(x) if(isS4(x)) NA else object.size(x)
options(dataview = opt)



