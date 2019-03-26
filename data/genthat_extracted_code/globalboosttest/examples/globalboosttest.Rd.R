library(globalboosttest)


### Name: globalboosttest
### Title: Testing the additional predictive value of high-dimensional data
### Aliases: globalboosttest
### Keywords: htest

### ** Examples

# load globalboosttest library
library(globalboosttest)

# load the simulated data with binary outcome
data(simdatabin)
attach(simdatabin)
# Test with 25 permutations
test<-globalboosttest(X=X,Y=Y,Z=Z,nperm=25,mstop=c(100,500,1000))


# load the simulated data with survival outcome
data(simdatasurv)
attach(simdatasurv)
# Test with 25 permutations
test<-globalboosttest(X=X,Y=Surv(time,status),Z=NULL,nperm=25,mstop=c(100,500,1000),mstopAIC=FALSE)




