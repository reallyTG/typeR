library(modelfree)


### Name: bandwidth_cross_validation
### Title: Cross-validation estimate of bandwidth
### Aliases: bandwidth_cross_validation
### Keywords: nonparametric models regression nonlinear

### ** Examples

data("01_Miranda")
h<- bandwidth_cross_validation( example01$r, example01$m, example01$x, c( 0.1, 10 ) )



