library(cwhmisc)


### Name: interpol
### Title: Polynomial and rational interpolation
### Aliases: setupInterp evalInterp minInterp quadmin lerp
### Keywords: math symbolmath

### ** Examples

  opar <- par(mfrow=c(2,2))
  x <- c(1,2,4,6); y <- 1/x
  pint <- function( x, y, add, dopoly, ylab="" ) {
    print(paste(" minimum at = ", minInterp(x,y,add=add,doPoly=dopoly) ) )
    xP <- setupInterp(x,y,TRUE)
    xT <- setupInterp(x,y,FALSE)
    x0 <- seq(0,7,0.1); yP <- evalInterp(x0,xP)
    yT <- evalInterp(x0,xT)
    plot(x,y,xlim=c(-0.5,7.5),ylim=c(min(y)-2,max(y)+2),cex=2,ylab=ylab)
    lines(x0,yP,col=2,cex=0.5)
    lines(x0,yT,col=4,cex=0.5,pch="+")
    legend(x="bottom",c("polynomial", "rational"), col = c(2,4),
     text.col= "black", lty = 1, merge = TRUE, bg='white')
  }
  pint(x,y,add=FALSE,dopoly=TRUE,"1/x") # 6 ?? = minimum
  pint(x, (x-3)^2,add=FALSE,dopoly=TRUE,"(x-3)^2") # 3
  pint(x,x+1.0/x,add=FALSE,dopoly=FALSE,"x+1.0/x dopoly=F") # 1 -1
  pint(x,x+1.0/x,add=TRUE,dopoly=TRUE,"x+1.0/x dopoly=T") # 8.3471982 0.3194685
  par(opar)
  



