library(cgAUC)


### Name: c_cntin
### Title: c_cntin
### Aliases: c_cntin
### Keywords: c_cntin

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(y, z, l, h) {
    .Call('cgAUC_c_cntin', PACKAGE = 'cgAUC', y, z, l, h)
}



