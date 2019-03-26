library(cgAUC)


### Name: c_d_theta_sh_h_p
### Title: c_d_theta_sh_h_p
### Aliases: c_d_theta_sh_h_p
### Keywords: c_d_theta_sh_h_p

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(y, z, l, h) {
    .Call('cgAUC_c_d_theta_sh_h_p', PACKAGE = 'cgAUC', y, z, l, h)
}



