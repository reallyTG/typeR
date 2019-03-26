library(roughrf)


### Name: rrfc1
### Title: Roughenen Random Forests - C1 (RRFC1)
### Aliases: rrfc1

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

#AUC value for the testing dataset based on RRFC1
pred.rrfc1=rrfc1(dat,yvar,tr,te,mispct,number.trees)
print(colAUC(apply(pred.rrfc1$pred,1,mean),dat[te,yvar]))
}}
#



