library(DIFtree)


### Name: predict.DIFtree
### Title: Prediction from fitted Item focussed Trees
### Aliases: predict.DIFtree

### ** Examples

data(data_sim_Rasch)
 
Y <- data_sim_Rasch[,1]
X <- data_sim_Rasch[,-1]

Xnew <- data.frame("x1"=c(0,1),"x2"=c(-1.1,2.5),"x3"=c(1,0),"x4"=c(-0.2,0.7))
 
## Not run: 
##D  
##D mod <- DIFtree(Y=Y,X=X,model="Logistic",type="udif",alpha=0.05,nperm=1000,trace=TRUE)
##D  
##D predict(mod,item=1,Xnew)
## End(Not run)




