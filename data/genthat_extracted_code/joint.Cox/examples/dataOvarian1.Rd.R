library(joint.Cox)


### Name: dataOvarian1
### Title: Data on time-to-recurrence and 158 gene expressions for 912
###   ovarian cancer patients from 4 independent studies.
### Aliases: dataOvarian1
### Keywords: Datasets Ovarian cancer

### ** Examples

data(dataOvarian1)
######## univariate Cox ##########
t.event=dataOvarian1$t.event
event=dataOvarian1$event
X.mat=dataOvarian1[,-c(1,2,3,4)] ## gene expression
Symbol=colnames(dataOvarian1)[-c(1,2,3,4)] ## gene symbol

p=ncol(X.mat)
P_value=coef=NULL
for(j in 1:p){
  res=summary(coxph(Surv(t.event,event)~X.mat[,j]))$coefficients
  P_value=c(P_value,res[5])
  coef=c(coef,res[1])
}
data.frame( gene=Symbol[order(P_value)], P=P_value[order(P_value)], 
coef=round(coef[order(P_value)],3) )



