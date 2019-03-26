library(CorDiff)


### Name: CorDiff-package
### Title: Set-based differential covariance testing for genomics
### Aliases: CorDiff-package CorDiff
### Keywords: package

### ** Examples

library(mcc)

n1=5
n2=5
y=c(rep(1/n1,n1),rep(-1/n2,n2))
data(x)
w=(colSums(x))^2
output=getbetap.A(getAmoment(rbind(y,y),w,z=NULL),A=NULL,fix.obs=TRUE)
S.p=output$twosidedp[1]
## No test: 
Qresult=Qresid(y,x,numperms=1e6,thresh=10)
Q.p=Qresult$myp

newx=(t(x)%*%x)^2
v=colSums(newx)
output2=getbetap.A(getAmoment(rbind(y,y),v,z=NULL),A=NULL,fix.obs=TRUE)
C.p=output2$twosidedp[1]
M.p=getMpfast(y,x,num.perms=1e4)$pval
## End(No test)



