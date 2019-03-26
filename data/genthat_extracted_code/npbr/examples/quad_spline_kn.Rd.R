library(npbr)


### Name: quad_spline_kn
### Title: AIC and BIC criteria for choosing the optimal number of
###   inter-knot segments in quadratic spline fits
### Aliases: quad_spline_kn
### Keywords: nonparametric optimize

### ** Examples

data("green")
## Not run: 
##D # BIC criteria for choosing the optimal number of 
##D # inter-knot segments in:   
##D # a. Unconstrained quadratic spline fits
##D (kn.bic.green.u <- quad_spline_kn(log(green$COST), 
##D  log(green$OUTPUT), method = "u", type = "BIC"))
##D # b. Monotone quadratic spline smoother
##D (kn.bic.green.m <- quad_spline_kn(log(green$COST), 
##D  log(green$OUTPUT), method = "m", type = "BIC"))  
##D # c. Monotone and concave quadratic spline smoother
##D (kn.bic.green.mc<-quad_spline_kn(log(green$COST), 
##D  log(green$OUTPUT), method = "mc", type = "BIC"))
## End(Not run)



