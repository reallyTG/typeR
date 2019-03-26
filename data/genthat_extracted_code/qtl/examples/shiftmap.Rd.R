library(qtl)


### Name: shiftmap
### Title: Shift starting points in genetic maps
### Aliases: shiftmap
### Keywords: utilities

### ** Examples

data(hyper)
shiftedhyper <- shiftmap(hyper, offset=0)
par(mfrow=c(1,2))
plotMap(hyper, shift=FALSE, alternate.chrid=TRUE)
plotMap(shiftedhyper, shift=FALSE, alternate.chrid=TRUE)



