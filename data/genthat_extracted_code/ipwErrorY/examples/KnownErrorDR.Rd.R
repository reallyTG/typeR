library(ipwErrorY)


### Name: KnownErrorDR
### Title: Doubly Robust Estimation of ATE with Known Error
### Aliases: KnownErrorDR

### ** Examples

#create a dataset with sensitivity=0.95 and specificity=0.85
set.seed(100)
X=rnorm(2000)   
xx=X^2
A=rbinom(2000,1,1/(1+exp(-0.1-X-0.2*xx)))
Y=rbinom(2000,1,1/(1+exp(1-A-0.5*X-xx)))
y1=which(Y==1)
y0=which(Y==0) 
Y[y1]=rbinom(length(y1),1,0.95)
Y[y0]=rbinom(length(y0),1,0.15)
Yast=Y
da=data.frame(A=A,X=X,xx=xx,Yast=Yast)
head(da)
#apply the doubly robust correction method with sensitivity=0.95 and specificity=0.85
set.seed(100)
KnownErrorDR(da,"A","Yast",c("X","xx"),c("X","xx"),0.95,0.85,50,FALSE,0.95)




