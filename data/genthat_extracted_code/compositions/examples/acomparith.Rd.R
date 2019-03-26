library(compositions)


### Name: acomparith
### Title: Power transform in the simplex
### Aliases: power.acomp *.acomp /.acomp
### Keywords: multivariate

### ** Examples

acomp(1:5)* -1 + acomp(1:5)
data(SimulatedAmounts)
cdata <- acomp(sa.lognormals)
plot( tmp <- (cdata-mean(cdata))/msd(cdata) )
class(tmp)
mean(tmp)
msd(tmp)
var(tmp)



