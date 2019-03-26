library(modelfree)


### Name: bandwidth_bootstrap
### Title: Bootstrap estimate of bandwidth
### Aliases: bandwidth_bootstrap
### Keywords: nonparametric models regression nonlinear

### ** Examples

data("01_Miranda")
h<- bandwidth_bootstrap( example01$r, example01$m, example01$x, c( 0.1, 10 ), 10 )



