library(compositions)


### Name: plotmissingsummary
### Title: Plot a Missing Summary
### Aliases: plot.missingSummary as.missingSummary
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
x <- acomp(sa.lognormals)
xnew <- simulateMissings(x,dl=0.05,MAR=0.05,MNAR=0.05,SZ=0.05)
xnew
plot(missingSummary(xnew))



