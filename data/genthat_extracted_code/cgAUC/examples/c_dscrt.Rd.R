library(cgAUC)


### Name: c_dscrt
### Title: c_dscrt
### Aliases: c_dscrt
### Keywords: c_dscrt

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(y, z, l) {
    .Call('cgAUC_c_dscrt', PACKAGE = 'cgAUC', y, z, l)
}



