library(ecd)


### Name: ecld.y_slope
### Title: Analytic solution for the slope of y(x) in lambda distribution
### Aliases: ecld.y_slope ecld.y_slope_trunc
### Keywords: y_slope

### ** Examples

ld <- ecld(sigma=0.01*ecd.mp1)
x <- seq(-0.1, 0.1, by=0.01)
ecld.y_slope(ld,x)
ecld.y_slope_trunc(ld)



