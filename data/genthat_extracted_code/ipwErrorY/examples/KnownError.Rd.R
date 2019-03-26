library(ipwErrorY)


### Name: KnownError
### Title: Estimation of ATE with Known Error
### Aliases: KnownError

### ** Examples

#create a dataset with sensitivity=0.95 and specificity=0.85
set.seed(100)
X1=rnorm(2000) 
A=rbinom(2000,1,1/(1+exp(-0.2-X1)))
Y=rbinom(2000,1,1/(1+exp(-0.2-A-X1)))
y1=which(Y==1)
y0=which(Y==0) 
Yast=Y
Yast[y1]=rbinom(length(y1),1,0.95)
Yast[y0]=rbinom(length(y0),1,0.15)
da=data.frame(X1=X1,A=A,Yast=Yast)
head(da)
#apply the correction method with sensitivity=0.95 and specificity=0.85
KnownError(da,"A","Yast","X1",0.95,0.85,0.95)




