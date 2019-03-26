library(fda.usc)


### Name: classif.tree
### Title: Classification Fitting Functional Recursive Partitioning and
###   Regression Trees
### Aliases: classif.tree
### Keywords: classif

### ** Examples


data(phoneme)
mlearn<-phoneme[["learn"]]
glearn<-phoneme[["classlearn"]]
mtest<-phoneme[["test"]]
gtest<-phoneme[["classtest"]]
dataf<-data.frame(glearn)
dat=list("df"=dataf,"x"=mlearn)
a1<-classif.tree(glearn~x,data=dat)
summary(a1)
newdat<-list("x"=mtest)
p1<-predict.classif(a1,newdat,type="class")
table(gtest,p1)
sum(p1==gtest)/250



