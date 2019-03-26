library(LatticeKrig)


### Name: LKrigSetupAwght
### Title: Method to create a.wght component from the 'LKinfo' object.
### Aliases: LKrigSetupAwght LKrigSetupAwghtObject LKrigSetupAwght.default
###   LKrigSetupAwght.LKRectangle
### Keywords: spatial

### ** Examples

  x<- cbind( c(0,1))
  LKinfo<- LKrigSetup( x,LKGeometry="LKInterval", alpha=c( 1,.2,.01),
                   nlevel=3, a.wght=4.5, NC= 3)
  a.wghtList<- LKrigSetupAwght( LKinfo)
  
  x<- cbind( c(0,1), c(0,1))
  LKinfo<- LKrigSetup( x, alpha=c( 1,.2,.01),
                   nlevel=3, a.wght=4.5, NC= 3)
  a.wghtList<- LKrigSetupAwght( LKinfo)
# see   
  names(attributes( a.wghtList))
 
  



