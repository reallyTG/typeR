## ----eval=TRUE,message=FALSE, warning=FALSE------------------------------
library( KRIG )

## ----eval=TRUE,message=FALSE, warning=FALSE------------------------------
m<-100
XLim<-c( -3, 6 )
x<-seq( XLim[1], XLim[2], length.out = m )
f<-function(x){
  return( 1 + exp(-x^2) + 0.4 * exp(-(x-2)^2 ) - 0.5 * exp( -(x-4)^2 ) ) 
}
z<-sapply( x, f )

## ----eval=TRUE,message=FALSE, warning=FALSE------------------------------
n<-10
X<-matrix( runif( n, XLim[1], XLim[2] ), n, 1 )

Z<-matrix( sapply( X, f ), n, 1 )

m<-100
YLim<-c(-3.5,6.5)
Y<-matrix( seq( YLim[1], YLim[2], length.out = m ), m, 1 )

## ----eval=TRUE,message=FALSE, warning=FALSE------------------------------
G<-rbind( t( X ), t( X * X ), t( X * X * X ) )

g<-rbind( t( Y ), t( Y * Y ), t( Y * Y * Y ) )

## ----eval=TRUE,message=FALSE, warning=FALSE------------------------------
s<-0.1
t<-1

Kern<-function( x, y ) {
  h<-sqrt( sum( ( x - y )^2 ) )
  return( gaussian_kernel( h, s, t ) )
}

## ----eval=TRUE,message=FALSE, warning=FALSE------------------------------
K = Kov( X, X, Kern, TRUE )
k = Kov( Y, X, Kern );

KRIG<-Krig( Z = Z,
            K = K, 
            k = k,
            G = G,
            g = g,
            type = "universal", 
            cinv = 'syminv' )

## ----eval=TRUE,message=FALSE, warning=FALSE------------------------------
round( max( G %*% KRIG$L - g ), 10 )

## ----eval=TRUE,fig.show='hold', fig.show='hold', fig.align="center", fig.width=7, fig.height=4----
ymin<-min( z, KRIG$Z[,1], Z[,1] )
ymax<-max( z, KRIG$Z[,1], Z[,1] )
plot( x, z, type = 'l', lwd = 2, col='gold', ylim = c( ymin, ymax ), xlim = YLim )
points( Y, KRIG$Z[,1], col='darkgreen', type = 'l', lwd = 2 )
points( X, Z[,1], col = 'dodgerblue3', pch = 16, cex = 1.2 )

