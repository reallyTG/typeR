library(fda.usc)


### Name: classif.gkam
### Title: Classification Fitting Functional Generalized Kernel Additive
###   Models
### Aliases: classif.gkam
### Keywords: classif

### ** Examples


## Time-consuming: selection of 2 levels 
 data(phoneme)
 mlearn<-phoneme[["learn"]][1:100]
 glearn<-as.numeric(phoneme[["classlearn"]][1:100])
 dataf<-data.frame(glearn)
 dat=list("df"=dataf,"x"=mlearn)
# a1<-classif.gkam(glearn~x,data=dat)
# summary(a1)
 mtest<-phoneme[["test"]][1:100]
 gtest<-as.numeric(phoneme[["classtest"]][1:100])
 newdat<-list("x"=mtest)
# p1<-predict.classif(a1,newdat)
# table(gtest,p1)




