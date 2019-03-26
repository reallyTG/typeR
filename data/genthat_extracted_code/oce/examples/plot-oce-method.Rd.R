library(oce)


### Name: plot,oce-method
### Title: Plot an oce Object
### Aliases: plot,oce-method plot.oce

### ** Examples

library(oce)
o <- new("oce")
o <- oceSetData(o, 'x', rnorm(10))
o <- oceSetData(o, 'y', rnorm(10))
o <- oceSetData(o, 'z', rnorm(10))
plot(o)



