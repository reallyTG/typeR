library(bigmatch)


### Name: check
### Title: Check SMDs of the matched data set.
### Aliases: check

### ** Examples

# To run this example, you must load the optmatch package.

# Caliper of .2 on the propensity score, near fine balance of
# education, a robust Mahalanobis distrance for X.
data(nh0506)
attach(nh0506)
X<-cbind(female,age,black,hispanic,education,povertyr,bmi)
m<-nfmatch(z=z,p=propens,fine=education,X=X,caliper=.2,dat=nh0506,rank=FALSE)
matcheddata<-m$data
Xm<-subset(matcheddata, select=c('female','age','black','hispanic','education','povertyr','bmi'))
check(X,Xm,z,matcheddata$z)
detach(nh0506)



