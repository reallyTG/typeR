library(LatticeKrig)


### Name: LKrigSetup
### Title: Create or update the LatticeKrig model object (LKinfo) for
###   spatial fitting.
### Aliases: LKrigSetup LKinfoUpdate LatticeKrigEasyDefaults LKinfo
### Keywords: spatial

### ** Examples

  data(ozone2)
  # find the ranges of the  data, this is the same as passing
  # the entire set of observation locations and is more compact 
  sDomain<-apply( ozone2$lon.lat, 2,"range")
  LKinfo<- LKrigSetup( sDomain, NC=10, nlevel=2, alpha=c(1,.5),
                       a.wght = 5)
  print( LKinfo)
  LKinfo2<- LKinfoUpdate( LKinfo,  a.wght=4.1, NC=12)
  LKinfo3<- LKrigSetup( sDomain, NC=12, nlevel=2, alpha=c(1,.5),
                        a.wght=4.1)
# LKinfo2 and LKinfo3 should be the same.                         
 



