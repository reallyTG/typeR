library(plsRglm)


### Name: plot.table.summary.cv.plsRglmmodel
### Title: Plot method for table of summary of cross validated plsRglm
###   models
### Aliases: plot.table.summary.cv.plsRglmmodel
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=10,NK=1,
modele="pls-glm-family",family=gaussian())
plot(cvtable(summary(bbb)),type="CVQ2Chi2")
rm(list=c("XCornell","yCornell","bbb"))

## No test: 
data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=10,NK=1,
modele="pls-glm-family",family=gaussian())
plot(cvtable(summary(bbb)),type="CVQ2Chi2")
rm(list=c("XCornell","yCornell","bbb"))
## End(No test)



