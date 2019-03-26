library(modelfree)


### Name: bootstrap_sd_th
### Title: Bootstrap estimate the standard deviation of threshold
###   estimation
### Aliases: bootstrap_sd_th
### Keywords: nonparametric models regression nonlinear

### ** Examples

data( "01_Miranda" )
bwd <- 0.2959
value <- bootstrap_sd_th( 0.5, example01$r, example01$m, example01$x, 10, bwd )



