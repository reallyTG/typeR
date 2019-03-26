library(modelfree)


### Name: bootstrap_ci_th
### Title: Bootstrap estimate of confidence interval for threshold
###   estimation
### Aliases: bootstrap_ci_th
### Keywords: nonparametric models regression nonlinear

### ** Examples

data( "01_Miranda" )
bwd <- 0.2959;
value <- bootstrap_ci_th( 0.5, example01$r, example01$m, example01$x, 10, bwd );



