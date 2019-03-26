library(dr)


### Name: drop1.dr
### Title: Sequential fitting of coordinate tests using a dr object
### Aliases: drop1.dr dr.step
### Keywords: regression

### ** Examples

data(ais)
# To make this idential to ARC, need to modify slices to match by
# using slice.info=dr.slices.arc() rather than nslices=8
summary(s1 <- dr(LBM~log(SSF)+log(Wt)+log(Hg)+log(Ht)+log(WCC)+log(RCC)+
                 log(Hc)+log(Ferr), data=ais,method="sir",
                 slice.method=dr.slices.arc,nslices=8)) 
# The following will almost duplicate information in Table 5 of Cook (2004).
# Slight differences occur because a different approximation for the
# sum of independent chi-square(1) random variables is used:
ans1 <- drop1(s1)
ans2 <- drop1(s1,d=2)
ans3 <- drop1(s1,d=3)
# remove predictors stepwise until we run out of variables to drop.
dr.step(s1,scope=~log(Wt)+log(Ht))



