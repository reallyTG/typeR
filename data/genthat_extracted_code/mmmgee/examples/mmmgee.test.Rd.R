library(mmmgee)


### Name: mmmgee.test
### Title: Hypothesis Tests for Linear Contrasts in Multiple Marginal GEE
###   Models
### Aliases: mmmgee.test

### ** Examples

data(keratosis)
m1<-geem2(clearance~trt,id=id,data=keratosis,family=binomial,corstr="independence")
m2<-geem2(pain~trt,id=id,data=keratosis[keratosis$lesion==1,],family=gaussian,corstr="independence")
L1<-L2<-diag(1,4)[-1,]
mmmgee.test(x=m1,L=list(L1),statistic="wald",type="maximum")
mmmgee.test(x=m1,L=list(L1),statistic="score",type="maximum")
mmmgee.test(x=list(m1,m2),L=list(L1,L2),type="maximum",asymptotic=FALSE,biascorr=TRUE)
mmmgee.test(x=list(m1,m2),L=list(L1,L2),type="maximum",closed.test=TRUE)
mmmgee.test(x=list(m1,m2),L=list(L1,L2),type="maximum",asymptotic=FALSE,
	alternative="less",conf.int=TRUE,denomDF=40)
mmmgee.test(x=list(m1,m2),L=list(L1,L2),type="quadratic",asymptotic=TRUE)
mmmgee.test(x=list(m1,m2),L=list(L1,L2),statistic="score",type="quadratic")
mmmgee.test(x=list(m1,m2),L=list(L1,L2),statistic="score",type="maximum")




