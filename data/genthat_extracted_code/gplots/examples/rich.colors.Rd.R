library(gplots)


### Name: rich.colors
### Title: Rich Color Palettes
### Aliases: rich.colors
### Keywords: color

### ** Examples

m <- abs(matrix(1:120+rnorm(120), nrow=15, ncol=8))
opar <- par(bg="gray", mfrow=c(1,2))
matplot(m, type="l", lty=1, lwd=3, col=rich.colors(8))
matplot(m, type="l", lty=1, lwd=3, col=rich.colors(8,"blues"))
par(opar)

barplot(rep(1,100), col=rich.colors(100), space=0, border=0, axes=FALSE)
barplot(rep(1,20), col=rich.colors(40)[11:30]) # choose subset

plot(m, rev(m), ylim=c(120,0), pch=16, cex=2,
     col=rich.colors(200,"blues",alpha=0.6)[1:120]) # semitransparent

rich.colors(100, plot=TRUE)  # describe rgb recipe

par(mfrow=c(2,2))
barplot(m, col=heat.colors(15), main="\nheat.colors")
barplot(m, col=1:15, main="\ndefault palette")
barplot(m, col=rich.colors(15), main="\nrich.colors")
barplot(m, col=rainbow(15), main="\nrainbow")
par(opar)



