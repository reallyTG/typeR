library(DiPs)


### Name: addDirectPenalty
### Title: Add a directional penalty to a distance object
### Aliases: addDirectPenalty

### ** Examples

data("nh0506Homocysteine")
attach(nh0506Homocysteine)
X<-cbind(female,age,black,education,povertyr,bmi)
p<-glm(z~female+age+black+education+povertyr+bmi,family=binomial)$fitted.values
d<-cbind(nh0506Homocysteine,p)
detach(nh0506Homocysteine)
dist<-maha_dense(d$z,X)
head(dist$d)
dist<-addDirectPenalty(dist, d$z, d$p, positive=TRUE, penalty = 1)
head(dist$d)



