library(roughrf)


### Name: rrfa
### Title: Roughenen Random Forests - A (RRFA)
### Aliases: rrfa

### ** Examples

if(require(MASS)){
if(require(caTools)){

dat=rbind(Pima.tr,Pima.te)
number.trees=50
#number.trees=500
tr=1:200
te=201:532
mispct=0.4
yvar=ncol(dat)
  
#AUC value for the testing dataset based on the original random forests
rf=randomForest(dat[tr,-yvar],dat[tr,yvar],dat[te,-yvar],ntree=number.trees)
print(colAUC(rf$test$votes[,2],dat[te,yvar])) 

#AUC value for the testing dataset based on RRFA
pred.rrfa=rrfa(dat,yvar,tr,te,mispct,number.trees)
print(colAUC(apply(pred.rrfa$pred,1,mean),dat[te,yvar]))
}}




