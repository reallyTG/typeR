library(roughrf)


### Name: rrfc2
### Title: Roughenen Random Forests - C2 (RRFC2)
### Aliases: rrfc2

### ** Examples

if(require(MASS)){
if(require(caTools)){

dat=rbind(Pima.tr,Pima.te)
number.trees=50
#number.trees=500
tr=1:200
te=201:532
mispct=0.2
yvar=ncol(dat)
  
#AUC value for the testing dataset based on the original random forests
rf=randomForest(dat[tr,-yvar],dat[tr,yvar],dat[te,-yvar],ntree=number.trees)
print(colAUC(rf$test$votes[,2],dat[te,yvar]))

#AUC value for the testing dataset based on RRFC2
pred.rrfc2=rrfc2(dat,yvar,tr,te,mispct,number.trees)
print(colAUC(apply(pred.rrfc2$pred,1,mean),dat[te,yvar]))

}}





