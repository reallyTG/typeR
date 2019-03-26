library(DiPs)


### Name: maha_dense
### Title: Creates a robust Mahalanobis distance for matching based on a
###   dense network.
### Aliases: maha_dense

### ** Examples

data("nh0506Homocysteine")
attach(nh0506Homocysteine)
X<-cbind(female,age,black,education,povertyr,bmi)
dist<-maha_dense(z,X)
head(dist$d)
detach(nh0506Homocysteine)




