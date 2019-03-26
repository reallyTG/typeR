library(sads)


### Name: likelregions-class
### Title: Class '"likelregions"' for likelihood profiles of maximum
###   likelihood fits
### Aliases: likelregions-class show,likelregions-method
### Keywords: classes

### ** Examples

x1.gamma <- fitgamma(moths)
x1.p <- profile(x1.gamma)
likelregions(x1.p)
# Compare with...
confint(x1.p)



