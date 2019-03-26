library(compositions)


### Name: rcomparithm
### Title: Arithmetic operations for compositions in a real geometry
### Aliases: +.rcomp -.rcomp *.rcomp /.rcomp convex.rcomp
### Keywords: multivariate

### ** Examples

rcomp(1:5)* -1 + rcomp(1:5)
data(SimulatedAmounts)
cdata <- rcomp(sa.lognormals)
plot( tmp <- (cdata-mean(cdata))/msd(cdata) )
class(tmp)
mean(tmp)
msd(tmp)
var(tmp)
plot(convex.rcomp(rcomp(c(1,1,1)),sa.lognormals,0.1))



