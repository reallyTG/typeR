library(modelfree)


### Name: threshold_slope
### Title: Threshold and slope of estimated psychometric function
### Aliases: threshold_slope
### Keywords: nonparametric models regression nonlinear

### ** Examples

data( "01_Miranda" )
xnew = 1.2 * (0:999)/999+0.1
h = 0.2959
fit <- locglmfit( xnew, example01$r, example01$m, example01$x, h )
value <- threshold_slope( fit$pfit , xnew )



