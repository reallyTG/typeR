library(OptSig)


### Name: R.OLS
### Title: Restricted OLS estimation and F-test
### Aliases: R.OLS
### Keywords: htest

### ** Examples

data(data1)
# Define Y and X
y=data1$lnoutput; x=cbind(data1$lncapital,data1$lnlabor)
# Restriction matrices to test for constant returns to scale
Rmat=matrix(c(0,1,1),nrow=1); rvec=matrix(1,nrow=1)
# Model Estimation and F-test
M=R.OLS(y,x,Rmat,rvec) 



