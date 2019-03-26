library(cgAUC)


### Name: c_s_h
### Title: c_s_h
### Aliases: c_s_h
### Keywords: c_s_h

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(t, h) {
    .Call('cgAUC_c_s_h', PACKAGE = 'cgAUC', t, h)
}



