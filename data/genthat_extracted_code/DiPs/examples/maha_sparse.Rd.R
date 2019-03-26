library(DiPs)


### Name: maha_sparse
### Title: Creates a robust Mahalanobis distance for matching based on a
###   sparse network.
### Aliases: maha_sparse

### ** Examples

data("nh0506Homocysteine")
attach(nh0506Homocysteine)
X<-cbind(female,age,black,education,povertyr,bmi)
p<-glm(z~female+age+black+education+povertyr+bmi,family=binomial)$fitted.values
d<-cbind(nh0506Homocysteine,p)
detach(nh0506Homocysteine)
## No test: 
#apply symmetric caliper 0.15 on propensity score
dist1<-maha_sparse(d$z,X,p,0.15)
length(dist1$d)
## End(No test)
#apply symmetric caliper 0.1 on propensity score
dist2<-maha_sparse(d$z,X,p,0.1)
length(dist2$d)



