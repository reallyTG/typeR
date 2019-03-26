library(fda.usc)


### Name: classif.glm
### Title: Classification Fitting Functional Generalized Linear Models
### Aliases: classif.glm
### Keywords: classif

### ** Examples

data(phoneme)
mlearn<-phoneme[["learn"]]
glearn<-phoneme[["classlearn"]]
mtest<-phoneme[["test"]]
gtest<-phoneme[["classtest"]]
dataf<-data.frame(glearn)
dat=list("df"=dataf,"x"=mlearn)
a1<-classif.glm(glearn~x, data = dat)
newdat<-list("x"=mtest)
p1<-predict.classif(a1,newdat)
table(gtest,p1)
sum(p1==gtest)/250



