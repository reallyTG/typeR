library(spatstat)


### Name: quantess
### Title: Quantile Tessellation
### Aliases: quantess quantess.owin quantess.ppp quantess.im
### Keywords: spatial manip

### ** Examples

  plot(quantess(letterR, "x", 5))

  plot(quantess(bronzefilter, "x", 6))
  points(unmark(bronzefilter))

  opa <- par(mar=c(0,0,2,5))
  A <- quantess(Window(bei), bei.extra$elev, 4)
  plot(A, ribargs=list(las=1))
  
  B <- quantess(bei, bei.extra$elev, 4)
  tilenames(B) <- paste(spatstat.utils::ordinal(1:4), "quartile")
  plot(B, ribargs=list(las=1))
  points(bei, pch=".", cex=2, col="white")
  par(opa)



