library(dr)


### Name: dr
### Title: Main function for dimension reduction regression
### Aliases: dr dr.compute
### Keywords: regression

### ** Examples

data(ais)
# default fitting method is "sir"
s0 <- dr(LBM~log(SSF)+log(Wt)+log(Hg)+log(Ht)+log(WCC)+log(RCC)+
  log(Hc)+log(Ferr),data=ais) 
# Refit, using a different function for slicing to agree with arc.
summary(s1 <- update(s0,slice.function=dr.slices.arc))
# Refit again, using save, with 10 slices; the default is max(8,ncol+3)
summary(s2<-update(s1,nslices=10,method="save"))
# Refit, using phdres.  Tests are different for phd, and not
# Fit using phdres; output is similar for phdy, but tests are not justifiable. 
summary(s3<- update(s1,method="phdres"))
# fit using ire:
summary(s4 <- update(s1,method="ire"))
# fit using Sex as a grouping variable.  
s5 <- update(s4,group=~Sex)



