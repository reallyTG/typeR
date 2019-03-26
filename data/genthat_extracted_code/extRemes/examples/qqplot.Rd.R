library(extRemes)


### Name: qqplot
### Title: qq-plot Between Two Vectors of Data with 95 Percent Confidence
###   Bands
### Aliases: qqplot plot.qqplot summary.qqplot
### Keywords: hplot

### ** Examples

z <- rnorm(100)
y <- rexp(100)
qqplot( z, y)
qqplot( y, z)

data( ftcanmax)
qqplot( ftcanmax[,"Prec"], z)
obj <- qqplot( ftcanmax[,"Prec"], y, make.plot=FALSE)
plot(obj)
summary(obj)




