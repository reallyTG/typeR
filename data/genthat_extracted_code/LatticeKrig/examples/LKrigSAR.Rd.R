library(LatticeKrig)


### Name: LKrigSAR
### Title: Method that creates the spatial autoregressive (SAR) matrix.
### Aliases: LKrigSAR LKrigSAR.LKBox LKrigSAR.LKRectangle
###   LKrigSAR.LKInterval LKrigSAR.LKRing LKrigSAR.LKCylinder
###   LKrigSAR.default LKrigSAR.LKSphere
### Keywords: spatial

### ** Examples

    x<- cbind( c(0,1))
	LKinfo<- LKrigSetup(x,LKGeometry="LKInterval",
	               nlevel=3, NC=3, a.wght=5, alpha=c(1,.5,.2) )
	B<- LKrigSAR( LKinfo, Level=2)
	B<-spind2full(B)
	image.plot( B)
	
	LKinfo<- LKrigSetup(cbind( c(0,360), c(0,1)) ,LKGeometry="LKRing",
	               nlevel=1, NC=3, a.wght=5, alpha=1)
	B<- LKrigSAR( LKinfo, Level=1)
	B<-spind2full(B)
	image.plot( B)



