library(mefa)


### Name: plot.mefa
### Title: Plotting Methods for Object of Class 'mefa' and 'stcs'
### Aliases: plot.mefa boxplot.mefa image.mefa plot.stcs boxplot.stcs
###   image.stcs
### Keywords: hplot methods

### ** Examples

data(dol.count, dol.samp, dol.taxa)
x <- mefa(stcs(dol.count), dol.samp, dol.taxa)
## Frequency distributions
opar <- par(mfrow=c(2,2))
plot(x, 1)
plot(x, 2)
plot(x, 3)
plot(x, 4)
par(opar)
## Ranked curves
opar <- par(mfrow=c(2,2))
plot(x, 1, type="rank")
plot(x, 2, type="rank")
plot(x, 3, type="rank")
plot(x, 4, type="rank")
par(opar)
## Boxplot for segments
opar <- par(mfrow=c(2,2))
boxplot(x, 1)
boxplot(x, 2)
boxplot(x, 3)
boxplot(x, 4)
par(opar)
## Image (levelplot)
## comparing all and the segments
opar <- par(mfrow=c(1,3))
image(x, trafo = "bins", main = "All segments")
image(x, segm = 1, trafo = "bins", main = dimnames(x)$segm[1])
image(x, segm = 2, trafo = "bins", main = dimnames(x)$segm[2])
par(opar)
## For black and white, with names
image(x, col = grey(seq(0, 1, 0.1)), names = TRUE)
## For nice colors other than default
opar <- par(mfrow=c(1,2))
image(x[,,"fresh"], col = topo.colors(10),
main = "Fresh")
image(x[,,"broken"], col = terrain.colors(10),
main = "Broken")
par(opar)



