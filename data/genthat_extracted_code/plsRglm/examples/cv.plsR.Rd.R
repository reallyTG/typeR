library(plsRglm)


### Name: cv.plsR
### Title: Partial least squares regression models with k-fold
###   cross-validation
### Aliases: cv.plsR cv.plsRmodel.default cv.plsRmodel.formula
###   PLS_lm_kfoldcv PLS_lm_kfoldcv_formula
### Keywords: models regression

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]

#Leave one out CV (K=nrow(Cornell)) one time (NK=1)
bbb <- cv.plsR(dataY=yCornell,dataX=XCornell,nt=6,K=nrow(Cornell),NK=1)
bbb2 <- cv.plsR(Y~.,data=Cornell,nt=6,K=12,NK=1)
(sum1<-summary(bbb))

#6-fold CV (K=6) two times (NK=2)
#use random=TRUE to randomly create folds for repeated CV
bbb3 <- cv.plsR(dataY=yCornell,dataX=XCornell,nt=6,K=6,NK=2)
bbb4 <- cv.plsR(Y~.,data=Cornell,nt=6,K=6,NK=2)
(sum3<-summary(bbb3))

cvtable(sum1)
cvtable(sum3)
rm(list=c("XCornell","yCornell","bbb","bbb2","bbb3","bbb4"))



