library(artfima)


### Name: eaglecol
### Title: Tree-ring indicies for Douglas Fir, Colorado, 1107-1964.
### Aliases: eaglecol
### Keywords: datasets

### ** Examples

data(eaglecol)
plot(eaglecol)
## Not run: 
##D #confidence ellipse
##D library("ellipse") #needs this package!
##D ansTFD <- artfima(eaglecol)
##D v <- ansTFD$varbeta
##D bHat <- c(ansTFD$dHat, ansTFD$lambdaHat)
##D xy <- ellipse(v, centre=bHat, level=0.9)
##D plot(xy, type="l", lwd=2, xlab=expression(delta), ylab=expression(lambda))
##D points(matrix(bHat,ncol=2), pch=16, cex=3, col="blue")
##D #setwd("D:/DropBox/R/2016/artfima/Explore_ts_data/eaglecol")
##D #postscript(file="eaglecolCI.eps")
##D #plot(xy, type="l", lwd=2, xlab=expression(delta), ylab=expression(lambda))
##D #points(matrix(bHat,ncol=2), pch=16, cex=3, col="blue")
##D #graphics.off()
## End(Not run)
## Not run: 
##D #forecast comparison
##D 
## End(Not run)




