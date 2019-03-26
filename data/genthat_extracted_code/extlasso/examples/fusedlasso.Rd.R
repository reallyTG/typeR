library(extlasso)


### Name: fusedlasso
### Title: Fused lasso penalized linear regression
### Aliases: fusedlasso
### Keywords: Fused LASSO Penalized Regularized Jacobi Regression Gradient
###   descent

### ** Examples

n=50
p=100
rho=0
beta=rep(0,p)
beta[1:20]=1
beta[11:15]=2
beta[25]=3
beta[41:45]=1
x=matrix(rnorm(n*p),n,p)
y=x%*%beta+rnorm(n,0,0.5)
f1<-fusedlasso(x,y,lambda1=0.1,lambda2=1)
plot(beta,col="blue",type="b",pch=1,ylim=range(beta,f1$coef))
lines(f1$coef,type="b",lty=1,col="black")
legend("topright",pch=1,lty=1,merge=TRUE,text.col=c("blue","black"),legend=c("True","Fitted"))



