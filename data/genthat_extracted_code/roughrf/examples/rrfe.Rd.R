library(roughrf)


### Name: rrfe
### Title: Roughenen Random Forests - E (RRFE)
### Aliases: rrfe

### ** Examples

if(require(MASS)){
if(require(caTools)){
 
dat=rbind(Pima.tr,Pima.te)
number.trees=50
#number.trees=500
tr=1:200
te=201:532
mispct=0.5
yvar=ncol(dat)
k=2
  
#AUC value for the testing dataset based on the original random forests
rf=randomForest(dat[tr,-yvar],dat[tr,yvar],dat[te,-yvar],ntree=number.trees)
print(colAUC(rf$test$votes[,2],dat[te,yvar]))

#AUC value for the testing dataset based on RRFE
pred.rrfe=rrfe(dat,yvar,tr,te,mispct,number.trees,k)
print(colAUC(apply(pred.rrfe$pred,1,mean),dat[te,yvar]))
}}
#



