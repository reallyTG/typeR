library(dr)


### Name: dr.coordinate.test
### Title: Dimension reduction tests
### Aliases: dr.test dr.coordinate.test dr.joint.test dr.joint.test.default
###   dr.joint.test.ire dr.joint.test.pire dr.coordinate.test.default
###   dr.coordinate.test.sir dr.coordinate.test.save dr.coordinate.test.ire
###   dr.coordinate.test.pire
### Keywords: regression

### ** Examples

#  This will match Table 5 in Cook (2004).  
data(ais)
# To make this idential to Arc (Cook and Weisberg, 1999), need to modify slices to match.
summary(s1 <- dr(LBM~log(SSF)+log(Wt)+log(Hg)+log(Ht)+log(WCC)+log(RCC)+log(Hc)+log(Ferr),
  data=ais,method="sir",slice.function=dr.slices.arc,nslices=8))
dr.coordinate.test(s1,~.-log(Hg))
#The following nearly reproduces Table 5 in Cook (2004)
drop1(s1,chi2approx="wood",update=FALSE)
drop1(s1,d=2,chi2approx="wood",update=FALSE)
drop1(s1,d=3,chi2approx="wood",update=FALSE)



