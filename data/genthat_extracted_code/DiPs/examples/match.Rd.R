library(DiPs)


### Name: match
### Title: Minimum-distance near-fine matching.
### Aliases: match

### ** Examples

# To run this example, you must load the optmatch package.
## No test: 
data("nh0506Homocysteine")
attach(nh0506Homocysteine)
X<-cbind(female,age,black,education,povertyr,bmi)
p<-glm(z~female+age+black+education+povertyr+bmi,family=binomial)$fitted.values
d<-cbind(nh0506Homocysteine,p)
detach(nh0506Homocysteine)
dist<-maha_sparse(d$z,X,p,0.15)
o<-match(d$z, d$education, dist, d)
md<-o$data
head(md)
## End(No test)



