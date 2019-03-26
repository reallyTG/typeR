library(ggfortify)


### Name: fortify.basis
### Title: Convert spline basis instances to 'data.frame'
### Aliases: fortify.basis

### ** Examples

library(splines)
x <- seq(0, 1, by=0.001)
spl <- bs(x, df=6)
fortify(spl)



