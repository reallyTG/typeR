library(fields)


### Name: Exponential, Matern, Radial Basis
### Title: Covariance functions
### Aliases: Exponential Matern Matern.cor.to.range RadialBasis
### Keywords: spatial

### ** Examples

# a Matern correlation function 
 d<- seq( 0,10,,200)
 y<- Matern( d, range=1.5, smoothness=1.0)
 plot( d,y, type="l")

# Several Materns of different smoothness with a similar correlation 
# range

# find ranges for nu = .5, 1.0 and 2.0 
# where the correlation drops to .1 at a distance of 10 units.

 r1<- Matern.cor.to.range( 10, nu=.5, cor.target=.1)
 r2<- Matern.cor.to.range( 10, nu=1.0, cor.target=.1)
 r3<- Matern.cor.to.range( 10, nu=2.0, cor.target=.1)

# note that these equivalent ranges
# with respect to this correlation length are quite different
# due the different smoothness parameters. 

 d<- seq( 0, 15,,200)
 y<- cbind(  Matern( d, range=r1, nu=.5),
             Matern( d, range=r2, nu=1.0),
             Matern( d, range=r3, nu=2.0))

 matplot( d, y, type="l", lty=1, lwd=2)
 xline( 10)
 yline( .1)



