library(bigmatch)


### Name: smahal
### Title: Creates a robust Mahalanobis distance for matching.
### Aliases: smahal

### ** Examples

data(nh0506)
attach(nh0506)
X<-cbind(female,age,black,hispanic,education,povertyr)
dist<-smahal(z,propens,X,0.2)
dist$d[1:10]

dist2<-smahal(z,propens,X,0.2,exact=female,Xextra=hispanic,nearexact=bmi)
dist2$nearex[1:10]

detach(nh0506)



