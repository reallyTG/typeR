library(fda.usc)


### Name: classif.depth
### Title: Classifier from Functional Data
### Aliases: classif.depth
### Keywords: classif

### ** Examples

 
## Not run: 
##D data(phoneme)
##D mlearn<-phoneme[["learn"]]
##D mtest<-phoneme[["test"]]
##D glearn<-phoneme[["classlearn"]]
##D gtest<-phoneme[["classtest"]]
##D 
##D a1<-classif.depth(glearn,mlearn,depth="RP")
##D table(a1$group.est,glearn)
##D a2<-classif.depth(glearn,mlearn,depth="RP",CV=TRUE)
##D a3<-classif.depth(glearn,mlearn,depth="RP",CV=FALSE)
##D a4<-classif.depth(glearn,mlearn,mtest,"RP")
##D a5<-classif.depth(glearn,mlearn,mtest,"RP",CV=TRUE)     
##D table(a5$group.est,glearn)
##D a6<-classif.depth(glearn,mlearn,mtest,"RP",CV=FALSE)
##D table(a6$group.est,glearn)
## End(Not run)



