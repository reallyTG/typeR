library(stinepack)


### Name: na.stinterp
### Title: Replace NAs by Stineman interpolation
### Aliases: na.stinterp na.stinterp.default
### Keywords: ts

### ** Examples

na.stinterp(c(2,NA,1,4,5,2))
na.stinterp(ts(c(2,NA,1,4,5,2)))
## Not run: 
##D 
##D #comparison of gap filling with na.stinterp/stinterp and splines,
##D #the solid lines show the continuous interpolation functions 
##D #implicitly assumed by the gap-filling, they show how the Stineman
##D #interpolation restricts the range of the interpolant to the 
##D #nearby range of the points and suppresses the well known oscillations 
##D #characteristic of splines and other methods based on polynomials
##D x <- 1:6
##D y <- c(2,NA,1,4,5,2)
##D plot(x,y,ylim=c(-1,5))
##D points(na.stinterp(c(2,NA,1,4,5,2)),pch=2,col=2)
##D points(spline(x,y,n=6),pch=3,col=3)
##D lines(stinterp(x[!is.na(y)],y[!is.na(y)],xout=seq(1,6,by=0.1)),col=2)
##D lines(spline(x,y,n=50),col=3)
##D 
##D library(zoo)
##D na.stinterp(zoo(c(2,NA,1,4,5,2)))
##D 
##D library(its)
##D na.stinterp(its(c(2,NA,1,4,5,2), seq(Sys.time(), length = 6, by = "day")))
##D 
## End(Not run)




