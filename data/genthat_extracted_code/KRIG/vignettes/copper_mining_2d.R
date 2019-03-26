## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----load,eval=TRUE,message=FALSE, warning=FALSE-------------------------
library( data.table )
library( KRIG )
library( plotly )
library( colorRamps )

## ----data,eval=TRUE,message=FALSE, warning=FALSE-------------------------
data( 'Copper', package = 'KRIG' )

## ----processing,eval=TRUE,message=FALSE, warning=FALSE-------------------
X3<-c( 100, 105 )
Dat<-Copper[ x3 >= X3[1] & x3 <= X3[2] & Z > 0, list( x1, x2, Z ) ]
Dat<-Dat[ , list( Z = mean( Z ) ), by = list( x1, x2 ) ]

X<-as.matrix( Dat[ , list( x1, x2 ) ] )

Z<-as.matrix( Dat[ , list( Z ) ] )

m<-c( 90, 90 )
x1_lim<-c( min( X[,1] ), max( X[,1] ) )
x2_lim<-c( min( X[,2] ), max( X[,2] ) )

x1_loc<-c( 100, 100 )
x2_loc<-c( 100, 100 )
x1_lim<-c( x1_lim[1] - x1_loc[1], x1_lim[2] + x1_loc[2] )
x2_lim<-c( x2_lim[1] - x2_loc[1], x2_lim[2] + x2_loc[2] )

Y1<-seq( x1_lim[1], x1_lim[2], length.out = m[1] )
Y2<-seq( x2_lim[1], x2_lim[2], length.out = m[2] )

Y<-expand.grid( Y1, Y2 )
Y<-as.matrix( Y )

## ----est,eval=TRUE,message=FALSE, warning=FALSE--------------------------
dist<-function( x, y ) {
  return( sqrt( sum( ( x - y )^2 ) ) )
}
V<-variogram( Z, X, dist )
d<-V$distance[V$sort+1,1]

spherical_variogram<-function( d, s, t ) {
  return( s - spherical_kernel( d, s, t ) )
}

fit_spherical_kernel<-function( p ) {
  FV<-sapply( d, FUN = spherical_variogram, p[1], p[2] )
  return( sum( ( FV - V$variogram[,1] )^2 ) )
}
NLM<-nlm( fit_spherical_kernel, c( 0.1, 450 ) )
str( NLM )

FV<-sapply( d, FUN = spherical_variogram, NLM$estimate[1], NLM$estimate[2] )

## ----varg,eval=TRUE,fig.show='hold', fig.show='hold', fig.align="center", fig.width=7, fig.height=5----
plot( d, V$variogram[,1], 
      cex = 0.5, pch = 16, col = 'purple4',
      xlab = 'd', 
      ylab = 'v' )
points( d, FV, type = 'l', col = 'dodgerblue2' , lwd = 2 )

## ----kern,eval=TRUE,message=FALSE, warning=FALSE-------------------------
Kern<-function( x, y ) {
  h<-sqrt( sum( ( x - y )^2 ) )
  return( spherical_kernel( h, NLM$estimate[1], NLM$estimate[2] ) )
}

## ----krig,eval=TRUE,message=FALSE, warning=FALSE-------------------------
K = Kov( X, X, Kern, TRUE )
k = Kov( Y, X, Kern )

KRIG<-Krig( Z = Z,
            K = K, 
            k = k,
            G = matrix( 0, 1, 1),
            g = matrix( 0, 1, 1),
            type = "simple", 
            cinv = "syminv" )

W<-matrix( KRIG$Z, m[1], m[2] )

## ----curv,eval=TRUE,fig.show='hold', fig.show='hold', fig.align="center", fig.width=7, fig.height=5----
cols<-matlab.like2( 40 )
plot_ly( x = Y1, y = Y2, z = W, type = "contour", colors = cols,
         contours = list( start = 0, size = 0.05, end = 2.0, showlabels = TRUE ) )

