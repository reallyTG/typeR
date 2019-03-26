library(plsRglm)


### Name: plot.table.summary.cv.plsRmodel
### Title: Plot method for table of summary of cross validated plsR models
### Aliases: plot.table.summary.cv.plsRmodel
### Keywords: methods print

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsR(dataY=yCornell,dataX=XCornell,nt=6,K=6,NK=5)
plot(cvtable(summary(bbb)),type="CVQ2")
rm(list=c("XCornell","yCornell","bbb"))

## No test: 
data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsR(dataY=yCornell,dataX=XCornell,nt=6,K=6,NK=25)
plot(cvtable(summary(bbb)),type="CVQ2")
rm(list=c("XCornell","yCornell","bbb"))
## End(No test)



