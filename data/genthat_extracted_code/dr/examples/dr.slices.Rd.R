library(dr)


### Name: dr.slices
### Title: Divide a vector into slices of approximately equal size
### Aliases: dr.slices dr.slices.arc
### Keywords: regression

### ** Examples
 
data(ais)
summary(s1 <- dr(LBM~log(SSF)+log(Wt)+log(Hg)+log(Ht)+log(WCC)+log(RCC)+
                 log(Hc)+log(Ferr), data=ais,method="sir",nslices=8))
# To make this idential to ARC, need to modify slices to match.
summary(s2 <- update(s1,slice.info=dr.slices.arc(ais$LBM,8)))



