library(regRSM)


### Name: validate.regRSM
### Title: Selects the new final model from existing 'regRSM' object.
### Aliases: validate.regRSM validate
### Keywords: Model

### ** Examples

p=100
n=100
beta1 = numeric(p)
beta1[c(1,5,10)]=c(1,1,1)  
x = matrix(0,ncol=p,nrow=n)
xval = matrix(0,ncol=p,nrow=n)
for(j in 1:p){ 
    x[,j]=rnorm(n,0,1)
    xval[,j]=rnorm(n,0,1)  
}
y = x %*% beta1 + rnorm(n)
yval = xval %*% beta1 + rnorm(n)

p1 = regRSM(x,y,store_data=TRUE)
p2 = validate(p1,yval,xval)




