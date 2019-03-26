library(roughrf)


### Name: rrfd
### Title: Roughenen Random Forests - D (RRFD)
### Aliases: rrfd

### ** Examples

if(require(MASS)){
if(require(caTools)){
 
dat=rbind(Pima.tr,Pima.te)
number.trees=50
#number.trees=500
tr=1:200
te=201:532
mispct=0.7
yvar=ncol(dat)
m=5
  
#AUC value for the testing dataset based on the original random forests
rf=randomForest(dat[tr,-yvar],dat[tr,yvar],dat[te,-yvar],ntree=number.trees)
print(colAUC(rf$test$votes[,2],dat[te,yvar]))

#AUC value for the testing dataset based on RRFD
pred.rrfd=rrfd(dat,yvar,tr,te,mispct,number.trees,m)
print(colAUC(apply(pred.rrfd$pred,1,mean),dat[te,yvar]))
}}
#



