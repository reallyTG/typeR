library(plsRglm)


### Name: cvtable
### Title: Table method for summary of cross validated PLSR and PLSGLR
###   models
### Aliases: cvtable cvtable.plsR cvtable.plsRglm
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
cv.modpls <- cv.plsR(dataY=yCornell,dataX=XCornell,nt=6,K=6,NK=5)
res.cv.modpls <- cvtable(summary(cv.modpls))
plot(res.cv.modpls) #defaults to type="CVQ2"
rm(list=c("XCornell","yCornell","cv.modpls","res.cv.modpls"))

## No test: 
data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
cv.modpls <- cv.plsR(dataY=yCornell,dataX=XCornell,nt=6,K=6,NK=25)
res.cv.modpls <- cvtable(summary(cv.modpls))
plot(res.cv.modpls) #defaults to type="CVQ2"
rm(list=c("XCornell","yCornell","cv.modpls","res.cv.modpls"))
	
data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
cv.modpls <- cv.plsR(dataY=yCornell,dataX=XCornell,nt=6,K=6,NK=100)
res.cv.modpls <- cvtable(summary(cv.modpls))
plot(res.cv.modpls) #defaults to type="CVQ2"
rm(list=c("XCornell","yCornell","cv.modpls","res.cv.modpls"))

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
cv.modplsglm <- cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=6,K=6,
modele="pls-glm-gaussian",NK=100)
res.cv.modplsglm <- cvtable(summary(cv.modplsglm))
plot(res.cv.modplsglm) #defaults to type="CVQ2Chi2"
rm(list=c("XCornell","yCornell","res.cv.modplsglm"))
## End(No test)



