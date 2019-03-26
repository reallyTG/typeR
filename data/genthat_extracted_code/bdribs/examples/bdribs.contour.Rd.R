library(bdribs)


### Name: bdribs.contour
### Title: contour plot - draws plot (optional) and returns a matrix/grid
###   of posterior values
### Aliases: bdribs.contour

### ** Examples

## Sample calls
     #run 1: The contour plot
     ## No test: 
     bdribs.contour(ymax=15,pyrmax=2000,eincr=250,tol=1.5,k=2, bg.rate=0.0045)
     #run 2: Monitoring blinded AE over time using contour plot
     bdribs.contour(ymax=15,pyrmax=2000,eincr=250,tol=1.5,k=2, bg.rate=0.0045)
     obs.pyr=c(300,570,650,800, 1200, 1500)
     obs.y=c(2,4,5,6,10,12)
     points(obs.pyr, obs.y,type="p",pch=16, cex=1.4,col="maroon")
     if (length(obs.y)>1) points(c(0,obs.pyr), c(0,obs.y), type="s", lty=3, lwd=2,
     col="black")
     
## End(No test)



