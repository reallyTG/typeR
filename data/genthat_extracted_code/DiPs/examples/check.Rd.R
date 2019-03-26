library(DiPs)


### Name: check
### Title: Check standardized mean differences (SMDs) of the matched data
###   set.
### Aliases: check

### ** Examples

# To run this example, you must load the optmatch package.
## No test: 
data("nh0506Homocysteine")
attach(nh0506Homocysteine)
X<-cbind(female,age,black,education,povertyr,bmi)
p<-glm(z~female+age+black+education+povertyr+bmi,family=binomial)$fitted.values
d<-cbind(nh0506Homocysteine,p)
detach(nh0506Homocysteine)
dist<-maha_dense(d$z,X)
o<-match(d$z, d$education, dist, d)
matcheddata<-o$data
Xm<-subset(matcheddata, select=c('female','age','black','education','povertyr','bmi','p'))
check(cbind(X,p),Xm,d$z,matcheddata$z)
## End(No test)



