library(compositions)


### Name: ratioLoadings
### Title: Loadings of relations of two amounts
### Aliases: relativeLoadings relativeLoadings.princomp.acomp
###   relativeLoadings.princomp.aplus relativeLoadings.princomp.rcomp
###   relativeLoadings.princomp.rplus print.relativeLoadings.princomp.acomp
###   print.relativeLoadings.princomp.aplus
###   print.relativeLoadings.princomp.rcomp
###   print.relativeLoadings.princomp.rplus
###   plot.relativeLoadings.princomp.acomp
###   plot.relativeLoadings.princomp.aplus
###   plot.relativeLoadings.princomp.rcomp
###   plot.relativeLoadings.princomp.rplus
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
pc <- princomp(acomp(sa.lognormals5))
pc
summary(pc)
relativeLoadings(pc,log=TRUE)
relativeLoadings(pc)
relativeLoadings(pc,scale.sdev=1)
relativeLoadings(pc,scale.sdev=2)

plot(relativeLoadings(pc,log=TRUE))
plot(relativeLoadings(pc))
plot(relativeLoadings(pc,scale.sdev=1))
plot(relativeLoadings(pc,scale.sdev=2))





