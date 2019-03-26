library(fda.usc)


### Name: classif.gsam
### Title: Classification Fitting Functional Generalized Additive Models
### Aliases: classif.gsam
### Keywords: classif

### ** Examples


data(phoneme)
mlearn<-phoneme[["learn"]]
glearn<-phoneme[["classlearn"]]
mtest<-phoneme[["test"]]
gtest<-phoneme[["classtest"]]
dataf<-data.frame(glearn)
dat=list("df"=dataf,"x"=mlearn)
a1<-classif.gsam(glearn~s(x,k=3),data=dat)
summary(a1)
newdat<-list("x"=mtest)
p1<-predict.classif(a1,newdat)
table(gtest,p1)
sum(p1==gtest)/250



