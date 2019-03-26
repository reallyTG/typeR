library(roughrf)


### Name: rrfc7
### Title: Roughenen Random Forests - C7 (RRFC7)
### Aliases: rrfc7

### ** Examples

if(require(MASS)){
if(require(caTools)){
 
dat=rbind(Pima.tr,Pima.te)
number.trees=5  
#number.trees=500
tr=1:200
te=201:532
mispct=0.5
yvar=ncol(dat)
  
#AUC value for the testing dataset based on the original random forests
rf=randomForest(dat[tr,-yvar],dat[tr,yvar],dat[te,-yvar],ntree=number.trees)
print(colAUC(rf$test$votes[,2],dat[te,yvar]))

#AUC value for the testing dataset based on RRFC7
pred.rrfc7=rrfc7(dat,yvar,tr,te,mispct,number.trees)
print(colAUC(apply(pred.rrfc7$pred,1,mean),dat[te,yvar]))
}}
#



