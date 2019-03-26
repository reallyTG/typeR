library(roughrf)


### Name: rrfc5
### Title: Roughenen Random Forests - C5 (RRFC5)
### Aliases: rrfc5

### ** Examples

if(require(MASS)){
if(require(caTools)){

dat=rbind(Pima.tr,Pima.te)
number.trees=50
#number.trees=500
tr=1:200
te=201:532
mispct=0.1
yvar=ncol(dat)
  
#AUC value for the testing dataset based on the original random forests
rf=randomForest(dat[tr,-yvar],dat[tr,yvar],dat[te,-yvar],ntree=number.trees)
print(colAUC(rf$test$votes[,2],dat[te,yvar]))

#AUC value for the testing dataset based on RRFC5
pred.rrfc5=rrfc5(dat,yvar,tr,te,mispct,number.trees)
print(colAUC(apply(pred.rrfc5$pred,1,mean),dat[te,yvar]))
}}
#



