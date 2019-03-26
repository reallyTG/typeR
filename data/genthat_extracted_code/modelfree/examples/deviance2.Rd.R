library(modelfree)


### Name: deviance2
### Title: Deviance between data and fitted function
### Aliases: deviance2
### Keywords: nonparametric

### ** Examples

data( "01_Miranda" )
h = 0.2959
fit <- locglmfit( example01$x, example01$r, example01$m, example01$x, h )
Dev <- deviance2( example01$r, example01$m, fit$fitval )



