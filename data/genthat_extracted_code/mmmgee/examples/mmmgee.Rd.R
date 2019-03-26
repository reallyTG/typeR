library(mmmgee)


### Name: mmmgee
### Title: Covariance Matrix Estimation for Multiple Marginal GEE Models
### Aliases: mmmgee

### ** Examples

data(keratosis)
m1<-geem2(clearance~trt,id=id,data=keratosis,family=binomial,corstr="independence")
m2<-geem2(pain~trt,id=id,data=keratosis[keratosis$lesion==1,],family=gaussian,corstr="independence")
mmmgee(x=list(m1,m2),biascorr=TRUE)




