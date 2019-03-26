library(joint.Cox)


### Name: dataOvarian2
### Title: Data on time-to-death and 128 gene expressions for 912 ovarian
###   cancer patients from 4 independent studies.
### Aliases: dataOvarian2
### Keywords: Datasets Ovarian cancer

### ** Examples

data(dataOvarian2)
######## univariate Cox ##########
t.death=dataOvarian2$t.death
death=dataOvarian2$death
X.mat=dataOvarian2[,-c(1,2,3,4)] ## gene expression
Symbol=colnames(dataOvarian2)[-c(1,2,3,4)] ## gene symbol

p=ncol(X.mat)
P_value=coef=NULL
for(j in 1:p){
  res=summary(coxph(Surv(t.death,death)~X.mat[,j]))$coefficients
  P_value=c(P_value,res[5])
  coef=c(coef,res[1])
}
data.frame( gene=Symbol[order(P_value)], P=P_value[order(P_value)], 
coef=round(coef[order(P_value)],3) )



