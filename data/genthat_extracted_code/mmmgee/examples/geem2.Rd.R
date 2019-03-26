library(mmmgee)


### Name: geem2
### Title: Fit Generalized Estimating Equation Models
### Aliases: geem2

### ** Examples

data(keratosis)
m1<-geem2(clearance~trt,id=id,data=keratosis,family=binomial,corstr="independence")
summary(m1)
m2<-geem2(pain~trt,id=id,data=keratosis[keratosis$lesion==1,],family=gaussian,corstr="independence")
summary(m2)
geem2(pain~trt,id=id,data=keratosis[keratosis$lesion==1,],family=gaussian,corstr="exchangeable")





