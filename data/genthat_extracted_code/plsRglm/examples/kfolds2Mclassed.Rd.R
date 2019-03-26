library(plsRglm)


### Name: kfolds2Mclassed
### Title: Number of missclassified individuals for k-fold cross validated
###   partial least squares regression models.
### Aliases: kfolds2Mclassed
### Keywords: models regression

### ** Examples

## No test: 
data(aze_compl)
Xaze_compl<-aze_compl[,2:34]
yaze_compl<-aze_compl$y
bbb <- cv.plsR(dataY=yaze_compl,dataX=Xaze_compl,nt=10,K=8,NK=1)
bbb2 <- cv.plsR(dataY=yaze_compl,dataX=Xaze_compl,nt=10,K=8,NK=2)
kfolds2Mclassed(bbb)
kfolds2Mclassed(bbb2)
rm(list=c("Xaze_compl","yaze_compl","bbb","bbb2"))
## End(No test)



