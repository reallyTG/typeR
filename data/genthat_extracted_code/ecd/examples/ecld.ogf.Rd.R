library(ecd)


### Name: ecld.ogf
### Title: Option generating function (OGF) of ecld
### Aliases: ecld.ogf ecld.ogf_quartic ecld.ogf_integrate ecld.ogf_gamma
###   ecld.ogf_imnt_sum ecld.ogf_log_slope
### Keywords: ogf

### ** Examples

ld <- ecld(sigma=0.01*ecd.mp1)
k <- seq(-0.1, 0.1, by=0.05)
ecld.ogf(ld,k)



