library(DiPs)


### Name: addcaliper
### Title: Add a caliper, that need not be symmetric, to a distance object.
### Aliases: addcaliper

### ** Examples

data("nh0506Homocysteine")
attach(nh0506Homocysteine)
X<-cbind(female,age,black,education,povertyr,bmi)
p<-glm(z~female+age+black+education+povertyr+bmi,family=binomial)$fitted.values
d<-cbind(nh0506Homocysteine,p)
detach(nh0506Homocysteine)
dist0<-maha_dense(d$z,X)
#symmetric caliper
dist1<-addcaliper(dist0, d$z, d$p, c(-.3,.3), stdev = TRUE, penalty = 1000)
head(dist1$d)
#asymmetric caliper
dist2<-addcaliper(dist0, d$z, d$p, c(-.5,.1), stdev = TRUE, penalty = 1000)
head(dist2$d)



