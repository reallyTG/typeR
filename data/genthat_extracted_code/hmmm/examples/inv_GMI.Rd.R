library(hmmm)


### Name: inv_GMI
### Title: function to compute a vector of joint probabilities from a
###   vector of generalized marginal interactions (gmi)
### Aliases: inv_GMI

### ** Examples

# a joint distribution of 2 variables with 4 categories each

p4<-c(
0.0895, 0.0351 ,0.0004, 0.0003, 
0.0352, 0.2775, 0.0619, 0.0004, 
0.0004, 0.0620, 0.2775, 0.0351, 
0.0001, 0.0004, 0.0352, 0.089)

marg<-marg.list(c("l-m","m-l","l-l"), mflag="m") 
labelrisp<-c("R1","R2")
modello<-hmmm.model(marg=marg,lev=c(4,4),names=labelrisp)

etpar<-GMI(c(p4),c("l-m","m-l","l-l"),c(4,4),labelrisp,mflag="m")
etpar$gmi
p4rec<-inv_GMI(etpar$gmi,modello)
P<-cbind(p4rec,c(p4),c(p4)-p4rec)
colnames(P)<-c("prob","prob from eta","check")
P



