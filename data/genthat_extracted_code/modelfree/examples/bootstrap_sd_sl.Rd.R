library(modelfree)


### Name: bootstrap_sd_sl
### Title: Bootstrap estimate the standard deviation of slope estimation
### Aliases: bootstrap_sd_sl
### Keywords: nonparametric models regression nonlinear

### ** Examples

data( "01_Miranda" )
bwd <- 0.2959
value <- bootstrap_sd_sl( 0.5, example01$r, example01$m, example01$x, 10, bwd )



