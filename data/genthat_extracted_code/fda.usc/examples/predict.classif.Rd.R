library(fda.usc)


### Name: predict.classif
### Title: Predicts from a fitted classif object.
### Aliases: predict.classif
### Keywords: classif

### ** Examples


## Not run: 
##D data(phoneme)
##D mlearn<-phoneme[["learn"]][1:100]
##D glearn<-phoneme[["classlearn"]][1:100]
##D 
##D #	ESTIMATION knn
##D out1=classif.knn(glearn,mlearn,knn=3)
##D summary.classif(out1)
##D 
##D #	PREDICTION knn
##D mtest<-phoneme[["test"]][1:100]
##D gtest<-phoneme[["classtest"]][1:100]
##D pred1=predict.classif(out1,mtest)
##D table(pred1,gtest)
##D 
##D #	ESTIMATION kernel 
##D h=2^(0:5)
##D # using metric distances computed in classif.knn
##D out2=classif.kernel(glearn,mlearn,h=h,metric=out1$mdist)
##D summary.classif(out2)
##D #	PREDICTION kernel
##D pred2=predict.classif(out2,mtest)
##D table(pred2,gtest)
## End(Not run)



