library(LatticeKrig)


### Name: LKrigLatticeCenters
### Title: Methods to report the locations or scales associated with the
###   lattice points.
### Aliases: LKrigLatticeCenters LKrigLatticeCenters.default
###   LKrigLatticeScales LKrigLatticeScales.default
###   LKrigLatticeCenters.LKBox LKrigLatticeCenters.LKInterval
###   LKrigLatticeCenters.LKRectangle LKrigLatticeCenters.LKRing
###   LKrigLatticeCenters.LKCylinder LKrigLatticeCenters.LKSphere
### Keywords: spatial

### ** Examples

  x<- cbind( c(-1,2), c(-1,2))
  LKinfo<- LKrigSetup( x, alpha=c( 1,.2,.01),
                   nlevel=3, a.wght=4.5, NC= 10)
# lattice centers for the second level   
# not points added for buffer outside of spatial domain                
   look<- LKrigLatticeCenters(LKinfo, Level=2) 
# convert grid format (gridList)  to just locations
   look<- make.surface.grid( look)
   plot( look,  cex=.5)
   rect( -1,-1,2,2, border="red4")
   
    x<- cbind( c(0, 360), c( 1,3)) 
    LKinfo<- LKrigSetup( x, LKGeometry="LKRing",
                   nlevel=1, a.wght=4.5, NC= 10, V= diag(c( 1,.01) ) )
                   
    polar2xy<- function(x){
	x[,2]*cbind( cos(pi*x[,1]/180), sin(pi*x[,1]/180))}
	        
    look1<- LKrigLatticeCenters( LKinfo, Level=1)               
    look2<- LKrigLatticeCenters( LKinfo, Level=1, physicalCoordinates=TRUE )
    look3<- polar2xy( look2$Locations )
# Basis scales:    
      LKrigLatticeScales( LKinfo)
    
    set.panel(3,1)
    plot( make.surface.grid( look1))
    plot( look2$Locations)
    plot( look3)

                 



