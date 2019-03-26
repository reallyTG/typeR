library(SpatialEpi)


### Name: ldmultinom
### Title: log multinomial Density
### Aliases: ldmultinom
### Keywords: file

### ** Examples

p <- rep(0.2, 5)
x <- rmultinom(1, 10, p)
dmultinom(x, prob=p, log=TRUE)
ldmultinom(x, p)



