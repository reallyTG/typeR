library(npbr)


### Name: cub_spline_kn
### Title: AIC and BIC criteria for choosing the number of inter-knot
###   segments in cubic spline fits
### Aliases: cub_spline_kn
### Keywords: nonparametric optimize

### ** Examples

data("air")
# a. Unconstrained cubic spline fits
(kn.bic.air.u<-cub_spline_kn(air$xtab, air$ytab, 
 method="u", type="BIC"))
# b. Monotone cubic spline smoother
(kn.bic.air.m<-cub_spline_kn(air$xtab, air$ytab, 
 method="m", type="BIC")) 
# c. Monotone and Concave cubic spline smoother
(kn.bic.air.mc<-cub_spline_kn(air$xtab, air$ytab, 
 method="mc", type="BIC"))



