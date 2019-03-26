library(fields)


### Name: QTps
### Title: Robust and Quantile smoothing using a thin-plate spline
### Aliases: QTps
### Keywords: spatial

### ** Examples


data(ozone2)
x<- ozone2$lon.lat
y<- ozone2$y[16,]



# Smoothing fixed at 50 df 
    look1<- QTps( x,y, psi.scale= 15, df= 50)

## Not run: 
##D # Least squares spline (because scale is so large)
##D     look2<- QTps( x,y, psi.scale= 100, df= 50)
##D #
##D     y.outlier<- y
##D # add in a huge outlier.
##D     y.outlier[58]<- 1e5
##D     look.outlier1<- QTps( x,y.outlier, psi.scale= 15, df= 50)
##D # least squares spline.
##D     look.outlier2<- QTps( x,y.outlier, psi.scale=100 , df= 50)
##D #
##D     set.panel(2,2)
##D     surface( look1)
##D     title("robust spline")
##D     surface( look2)
##D     title("least squares spline")
##D     surface( look.outlier1,  zlim=c(0,250))
##D     title("robust spline w/outlier") 
##D     points( rbind(x[58,]), pch="+")
##D     surface( look.outlier2, zlim=c(0,250))
##D     title("least squares spline w/outlier")
##D     points( rbind(x[58,]), pch="+")
##D     set.panel()
## End(Not run)
# some quantiles
look50 <- QTps( x,y, psi.scale=.5)
look75 <- QTps( x,y,f.start= look50$fitted.values, alpha=.75)


# a simulated example that finds some different quantiles. 
## Not run: 
##D set.seed(123)
##D N<- 400
##D x<- matrix(runif( N), ncol=1)
##D true.g<- x *(1-x)*2
##D true.g<- true.g/ mean( abs( true.g))
##D y<-  true.g + .2*rnorm( N )
##D 
##D look0 <- QTps( x,y, psi.scale=10, df= 15)
##D look50 <- QTps( x,y, df=15)
##D look75 <- QTps( x,y,f.start= look50$fitted.values, df=15, alpha=.75)
## End(Not run)

## Not run: 
##D # this example tests the quantile estimate by Monte Carlo
##D # by creating many replicate point to increase the sample size. 
##D # Replicate points are used because the computations for the 
##D # spline are dominated by the number of unique locations not the 
##D # total number of points. 
##D set.seed(123)
##D N<- 80
##D M<- 200
##D x<- matrix( sort(runif( N)), ncol=1)
##D x<- matrix( rep( x[,1],M), ncol=1)
##D 
##D true.g<- x *(1-x)*2
##D true.g<- true.g/ mean( abs( true.g))
##D errors<- .2*(rexp( N*M) -1)
##D y<- c(matrix(true.g, ncol=M, nrow=N) + .2 *  matrix( errors, ncol=M, nrow=N))
##D 
##D look0 <- QTps( x,y, psi.scale=10, df= 15)
##D look50 <- QTps( x,y, df=15)
##D look75 <- QTps( x,y, df=15, alpha=.75)
##D 
##D 
##D bplot.xy(x,y, N=25)
##D xg<- seq(0,1,,200)
##D lines( xg, predict( look0, x=xg), col="red")
##D lines( xg, predict( look50, x=xg), col="blue")
##D lines( xg, predict( look75, x=xg), col="green")
## End(Not run)
## Not run: 
##D # A comparison with qsreg
##D   qsreg.fit50<- qsreg(rat.diet$t,rat.diet$con, sc=.5)
##D   lam<- qsreg.fit50$cv.grid[,1]
##D   df<- qsreg.fit50$cv.grid[,2]
##D   M<- length(lam)
##D   CV<-rep( NA, M)
##D   M<- length( df)
##D   fhat.old<- NULL
##D   for ( k in M:1){
##D      temp.obj<- QTps(rat.diet$t,rat.diet$con, f.start=fhat.old,  psi.scale=.5, tolerance=1e-6,
##D      verbose=FALSE, df= df[k])
##D      cat(k, " ")
##D      CV[k] <- temp.obj$Qinfo$CV.psuedo
##D      fhat.old<- temp.obj$fitted.values
##D   }
##D   plot( df, CV, type="l", lwd=2)
##D # psuedo data estimate
##D   points( qsreg.fit50$cv.grid[,c(5,6)], col="blue")
##D # alternative CV estimate via reweighted LS
##D   points( qsreg.fit50$cv.grid[,c(2,3)], col="red")
## End(Not run)





