library(compositions)


### Name: coloredBiplot
### Title: A biplot providing somewhat easier access to details of the
###   plot.
### Aliases: coloredBiplot coloredBiplot.default coloredBiplot.princomp
###   coloredBiplot.prcomp
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
coloredBiplot(x=princomp(acomp(sa.outliers5)),pc.biplot=FALSE,
          xlabs.pc=c(1,2,3), xlabs.col=2:4, col="black")



