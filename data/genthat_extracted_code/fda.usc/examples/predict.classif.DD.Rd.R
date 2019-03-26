library(fda.usc)


### Name: predict.classif.DD
### Title: Predicts from a fitted classif.DD object.
### Aliases: predict.classif.DD
### Keywords: classif

### ** Examples


## Not run: 
##D # DD-classif for multivariate data 
##D data(iris)
##D iris<-iris[1:100,]
##D ii<-sample(1:100,80)
##D group.train<-factor(iris[ii,5])
##D x.train<-iris[ii,1:4]
##D out1=classif.DD(group.train,x.train,depth="MhD",classif="lda")
##D out2=classif.DD(group.train,x.train,depth="MhD",classif="glm")
##D summary.classif(out1)
##D summary.classif(out2)
##D x.test<-iris[-ii,1:4]
##D pred1=predict.classif.DD(out1,x.test)
##D pred2=predict.classif.DD(out2,x.test)
##D group.test<-iris[-ii,5]
##D table(pred1,group.test)
##D table(pred2,group.test)
##D 
##D # DD-classif for Functional data
##D data(phoneme)
##D mlearn<-phoneme[["learn"]]
##D glearn<-phoneme[["classlearn"]]
##D 
##D #	ESTIMATION 
##D out1=classif.DD(glearn,mlearn,depth="FM",classif="glm")
##D summary.classif(out1)
##D #	PREDICTION 
##D mtest<-phoneme[["test"]]
##D gtest<-phoneme[["classtest"]]
##D pred1=predict.classif.DD(out1,mtest)
##D table(pred1,gtest)
## End(Not run)



