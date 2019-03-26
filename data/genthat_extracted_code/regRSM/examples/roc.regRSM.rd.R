library(regRSM)


### Name: roc.regRSM
### Title: ROC curve and AUC parameter.
### Aliases: roc.regRSM roc
### Keywords: Model

### ** Examples

p=100
n=100
beta1 = numeric(p)
beta1[c(1,5,10)]=c(1,1,1)
x = matrix(0,ncol=p,nrow=n)
for(j in 1:p){
    x[,j]=rnorm(n,0,1)
}
y = x %*% beta1 + rnorm(n)
p1 = regRSM(x,y,store_data=TRUE)
true = c(1,5,10)
roc(p1,true,plotit=TRUE)



