library(extRemes)


### Name: qqnorm
### Title: Normal qq-plot with 95 Percent Simultaneous Confidence Bands
### Aliases: qqnorm
### Keywords: hplot

### ** Examples

z <- rexp(100)
qqnorm( z)

y <- rnorm( 100)
qqnorm( y)
obj <- qqnorm(y, make.plot=FALSE)
str(obj)

data( ftcanmax)
qqnorm( ftcanmax[,"Prec"])



