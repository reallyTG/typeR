library(regRSM)


### Name: regRSM
### Title: Random Subspace Method (RSM) for linear regression.
### Aliases: regRSM.default regRSM.formula regRSM
### Keywords: Model

### ** Examples

p = 500
n = 50
beta1 = numeric(p)
beta1[c(1,5,10)] = c(1,1,1)  
x = matrix(0,ncol=p,nrow=n)
xtest = matrix(0,ncol=p,nrow=n)
for(j in 1:p){ 
    x[,j] = rnorm(n,0,1)
    xtest[,j] = rnorm(n,0,1)    
}
y = x %*% beta1 + rnorm(n)
p1 = regRSM(x,y)

data1 = data.frame(y,x)
p2 = regRSM(y~.,data=data1)



