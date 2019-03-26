library(compositions)


### Name: rplusarithm
### Title: vectorial arithmetic for data sets with rplus class
### Aliases: +.rplus -.rplus *.rplus /.rplus mul.rplus
### Keywords: multivariate

### ** Examples

rplus(1:5)* -1 + rplus(1:5)
data(SimulatedAmounts)
cdata <- rplus(sa.lognormals)
plot( tmp <- (cdata-mean(cdata))/msd(cdata) )
class(tmp)
mean(tmp)
msd(tmp)
var(tmp)



