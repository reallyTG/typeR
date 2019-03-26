library(roughrf)


### Name: rrfc6
### Title: Roughenen Random Forests - C6 (RRFC6)
### Aliases: rrfc6

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

#AUC value for the testing dataset based on RRFC6
pred.rrfc6=rrfc6(dat,yvar,tr,te,mispct,number.trees)
print(colAUC(apply(pred.rrfc6$pred,1,mean),dat[te,yvar]))
}}
#



