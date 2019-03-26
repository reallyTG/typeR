library(LatticeKrig)


### Name: LKrigSetupAlpha
### Title: Creates the alpha parameter list in LatticeKrig covariance.
### Aliases: LKrigSetupAlpha LKrigSetupAlpha.default
###   LKrigSetupAlpha.LKInterval LKrigSetupAlpha.LKRectangle
###   LKrigSetupAlpha.LKBox
### Keywords: spatial

### ** Examples

# an x that is just the limits of the domain	
  x<- cbind( c(0,1), c(0,1))
  
  LKinfo<- LKrigSetup( x, alpha=c( 1,.2,.01),
                   nlevel=3, a.wght=4.5, NC= 3)
  alphaList<- LKrigSetupAlpha( LKinfo)

  LKinfo<- LKrigSetup( x, nu=1, nlevel=4, a.wght=4.5, NC= 4)
  alphaList<- LKrigSetupAlpha( LKinfo)



