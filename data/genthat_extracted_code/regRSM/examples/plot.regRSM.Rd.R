library(regRSM)


### Name: plot.regRSM
### Title: Plot from 'regRSM' object.
### Aliases: plot.regRSM
### Keywords: Model

### ** Examples

p=500
n=50
beta1 = numeric(p)
beta1[c(1,5,10)]=c(1,1,1)  
x = matrix(0,ncol=p,nrow=n)
xval = matrix(0,ncol=p,nrow=n)
xtest = matrix(0,ncol=p,nrow=n)
for(j in 1:p){ 
    x[,j]=rnorm(n,0,1)
    xval[,j]=rnorm(n,0,1)  
}
y = x %*% beta1 + rnorm(n)
yval = xval %*% beta1 + rnorm(n)

p1=regRSM(x,y)
plot(p1)

p2 = regRSM(x,y,yval,xval,useGIC=FALSE)
plot(p2)



