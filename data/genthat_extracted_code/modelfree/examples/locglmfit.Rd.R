library(modelfree)


### Name: locglmfit
### Title: Local generalized linear fitting
### Aliases: locglmfit
### Keywords: nonparametric models regression nonlinear

### ** Examples

data( "01_Miranda" )
xnew = 1.2 * (0:99)/99+0.1
h <- 0.2959
fit <- locglmfit( xnew, example01$r, example01$m, example01$x, h )



